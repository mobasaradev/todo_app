import 'package:flutter/material.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/services/auth/auth_exceptions.dart';
import 'package:todo_app/services/auth/auth_services.dart';
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
                  await AuthService.firebase().logIn(
                    email: email.text,
                    password: password.text,
                  );
                  final user = AuthService.firebase().currentUser;

                  if (user?.isEmailVerified ?? false) {
                    //user verified
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(notesRoute, (route) => false);
                  } else {
                    //user not verified
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        verifyEmailRoute, (route) => false);
                  }
                } on UserNotFoundAuthException {
                  await showErrorDialog(context, 'User not found');
                } on WrongPasswordAuthException {
                  await showErrorDialog(context, 'Wrong password');
                } on GenericAuthException {
                  await showErrorDialog(context, 'Authentication error');
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
