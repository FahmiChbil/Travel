// ignore: file_names
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/Exceptions/exception.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> signIn(String email, password);
  Future<Unit> signUp(String email, password);
}

class ImplAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<Unit> signIn(String email, password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("succes");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("failed email");
        throw EmailException();
      } else if (e.code == 'wrong-password') {
        throw PasswordException();
      }
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> signUp(String email, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("${credential.user!.email}");
      print("==========================================");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailIUseException();
      }
    } catch (e) {
      print(e);
    }
    return Future.value(unit);
  }
}
