import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase/auth.dart';
import 'package:todo_app/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  AuthService auth = AuthService();
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: userName,
                      decoration: const InputDecoration(hintText: "john320"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: email,
                      decoration:
                          const InputDecoration(hintText: "john320@gmail.com"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: password,
                      decoration:
                          const InputDecoration(hintText: "password320"),
                      obscureText: true,
                    ),
                    TextFormField(
                      controller: phone,
                      decoration:
                          const InputDecoration(hintText: "+990123456789"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        try {
                          await auth.register(
                            userName.text,
                            email.text,
                            password.text,
                            phone.text,
                            context,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-email') {
                            print("Invalid Email and Password");
                          } else if (e.code == 'email-already-in-use') {
                            print("Email used once");
                          } else if (e.code == 'weak-password') {
                            print("Weak password. Make a strong password");
                          } else {
                            print(e);
                          }
                        }
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        ),
                      ),
                      child: const Text("Register"),
                    ),
                  ],
                ),
              );
            default:
              return const Text("Loading...");
          }
        },
      ),
    );
  }
}
