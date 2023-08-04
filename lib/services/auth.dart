import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null? UserModel(id: user.uid, date: '', email:  '', name: ''): null;
  }

  Stream<UserModel?> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signUp(email, password, name, date) async {
    try {
      UserCredential user = (await auth.createUserWithEmailAndPassword(
          email: email, password: password));
    
        await FirebaseFirestore.instance.collection('users')
            .doc(user.user!.uid)
            .set({'name' : name, 'email': email, 'date': date, 'id': user.user!.uid});
      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const SnackBar(content: Text('The password provided is too weak.'),);
      } else if (e.code == 'email-already-in-use') {
        const SnackBar(content: Text('The account already exists for that email.'),);
      }
    } catch (e) {
        const SnackBar(content: Text('Error creating the account, try again'),);
    }
  }

  Future signIn(email, password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong password'){
            const SnackBar(content: Text('Wrong password'),);
        }
    } catch (e) {
        const SnackBar(content: Text('An error ocurred while singin in, try again'),);
    }
  }
}
