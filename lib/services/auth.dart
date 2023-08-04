import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/feed.dart';
import '../models/user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null? UserModel(id: user.uid, date: '', email:  '', name: ''): null;
  }

  Stream<UserModel?> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signUp(email, password, name, date, context) async {
    try {
      UserCredential user = (await auth.createUserWithEmailAndPassword(
          email: email, password: password));
    
        await FirebaseFirestore.instance.collection('users')
            .doc(user.user!.uid)
            .set({'name' : name, 'email': email, 'date': date, 'id': user.user!.uid});
      _userFromFirebaseUser(user.user);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Feed()) 
        );
    } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.code.toString()),)
        );
    }
  }

  Future signIn(email, password, context) async {
    try {
        UserCredential user = (await auth.signInWithEmailAndPassword(
            email: email, password: password));

        _userFromFirebaseUser(user.user);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Feed()) 
        );
    } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.code.toString()),)
        );
    }
  }
}
