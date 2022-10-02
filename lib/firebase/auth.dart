import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> register(
    final email,
    final password,
    BuildContext context,
  ) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> login(
    final email,
    final password,
    BuildContext context,
  ) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
