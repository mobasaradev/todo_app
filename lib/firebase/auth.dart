import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:todo_app/pages/login.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;
  //register
  Future<void> register(
    final email,
    final password,
    BuildContext context,
  ) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await database.collection('user').add({
      "email": email,
      "password": password,
    }).then((value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
        (route) => false));
  }

  //Login
  Future<void> login(
    final email,
    final password,
    BuildContext context,
  ) async {
    await auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false));
  }

  Future<void> signout(BuildContext context) async {
    await auth.signOut().then((value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
        (route) => false));
  }
}
