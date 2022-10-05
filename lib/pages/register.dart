import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/services/auth/auth_exceptions.dart';
import 'package:todo_app/services/auth/auth_services.dart';
import 'package:todo_app/utilities/show_error_dialog.dart';

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
                  await AuthService.firebase()
                      .createUser(email: email.text, password: password.text);
                  
                  AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                } on InvalidEmailAuthException {
                  await showErrorDialog(
                      context,
                      'Invalid email and password',
                    );
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(
                      context,
                      'Email used once',
                    );
                } on WeakPasswordAuthException {
                  await showErrorDialog(
                      context,
                      'Weak password. Make a strong password',
                    );
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Failed to register',
                  );
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
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Have An Account? Login in here"),
            )
          ],
        ),
      ),
    );
  }
}
