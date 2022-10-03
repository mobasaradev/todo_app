import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase/auth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthService auth = AuthService();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(hintText: "email@gmail.com"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(hintText: "password123"),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () async {
                try {
                  await auth.login(
                    email.text,
                    password.text,
                    context,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-email') {
                    print("Invalid email and password");
                  } else if (e.code == 'user-not-found') {
                    print("User Not Found");
                  } else if (e.code == 'wrong-password') {
                    print("Wrong password");
                  }
                } catch (e) {
                  print(e.runtimeType);
                  print(e);
                }
              },
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              child: const Text("LogIn"),
            ),
          ],
        ),
      ),
    );
  }
}
