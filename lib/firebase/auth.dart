import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;
  //register
  Future<void> register(
    final email,
    final password,
    final userName,
    final phone,
    BuildContext context,
  ) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await database.collection('user').add({
      "userName": userName,
      "email": email,
      "password": password,
      "phone": phone,
    });
  }

  //Login
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
