import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? email;
  String? password;

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future<void> signUp() async {
    this.email = emailController.text;
    this.password = passwordController.text;

    //firebase authにユーザ追加
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    //登録したユーザのid取得
    final uid = userCredential.user!.uid;
    //firebase firestoreにユー追加
    final doc = FirebaseFirestore.instance.collection('users').doc(uid);
    await doc.set({
      'uid': uid,
      'email': email
    });
  }
}