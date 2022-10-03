import 'dart:developer' as devtools show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
              decoration: const InputDecoration(hintText: "john320@gmail.com"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(hintText: "password320"),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () async {
                try {
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  devtools.log(userCredential.toString());
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-email') {
                    devtools.log("Invalid Email and Password");
                  } else if (e.code == 'email-already-in-use') {
                    devtools.log("Email used once");
                  } else if (e.code == 'weak-password') {
                    devtools.log("Weak password. Make a strong password");
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
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login/', (route) => false);
              },
              child: const Text("Have An Account? Login in here"),
            )
          ],
        ),
      ),
    );
  }
}
