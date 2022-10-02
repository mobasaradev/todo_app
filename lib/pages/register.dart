import 'package:flutter/material.dart';
import 'package:todo_app/firebase/auth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration:
                      const InputDecoration(hintText: "email@gmail.com"),
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
                    await auth.register(
                      email.text,
                      password.text,
                      context,
                    );
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
        },
      ),
    );
  }
}
