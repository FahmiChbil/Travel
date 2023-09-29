// ignore: file_names
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/Exceptions/exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signIn(String email, password);
  Future<UserCredential> signUp(String email, password, userName);
}

class ImplAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<UserCredential> signIn(String email, password) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      firestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      }, SetOptions(merge: true));

      return userCredential;
      // print("succes");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print("failed email");
        throw EmailException();
      } else {
        throw PasswordException();
      }
    }
  }

  @override
  Future<UserCredential> signUp(String email, password, userName) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
        "userName": userName
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPasswordException();
      } else {
        throw EmailIUseException();
      }
    }
  }

  Future<Unit> signOut() async {
    await FirebaseAuth.instance.signOut();
    return Future.value(unit);
  }
}
