import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIN"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(hintText: "email@gmail.com"),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(hintText: "password123"),
            obscureText: true,
          ),
          OutlinedButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              await auth.createUserWithEmailAndPassword(
                  email: email, password: password);
            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            child: const Text("LogIn"),
          ),
        ],
      ),
    );
  }
}