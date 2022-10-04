import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  final user = FirebaseAuth.instance.currentUser;
                  if (user?.emailVerified ?? false) {
                    //user verified
                    Navigator.of(context)
                      .pushNamedAndRemoveUntil(notesRoute, (route) => false);
                    
                  } else {
                    //user not verified
                    Navigator.of(context)
                      .pushNamedAndRemoveUntil(verifyEmailRoute, (route) => false);
                  }
                  
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-email') {
                    await showErrorDialog(
                        context, 'Invalid email and password');
                  } else if (e.code == 'user-not-found') {
                    await showErrorDialog(context, 'User not found');
                  } else if (e.code == 'wrong-password') {
                    await showErrorDialog(context, 'Wrong password');
                  } else {
                    await showErrorDialog(context, 'Error: ${e.code}');
                  }
                } catch (e) {
                  await showErrorDialog(context, e.toString());
                }
              },
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              child: const Text("LogIn"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text("Don't have any account? Register in here"),
            )
          ],
        ),
      ),
    );
  }
}
