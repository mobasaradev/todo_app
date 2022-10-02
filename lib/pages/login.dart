import 'package:flutter/material.dart';
import 'package:todo_app/firebase/auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
        title: const Text("Login"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                      decoration:
                          const InputDecoration(hintText: "password123"),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        final UserCredential = auth.login(
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
                      child: const Text("LogIn"),
                    ),
                  ],
                ),
              );
            default:
              return const Text("loading");
          }
        },
      ),
    );
  }
}
