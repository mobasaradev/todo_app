import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIN"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "email@gmail.com"),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "password123"),
            obscureText: true,
          ),
          OutlinedButton(
            onPressed: () {},
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
