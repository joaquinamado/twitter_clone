import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
    final String? id;
    final String date;
    final String email;
    final String name;

    UserModel({this.id, required this.date, required this.email, required this.name});

    factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
        final data = document.data()!;
        return UserModel( 
            id: document.id,
            date: data["date"] ?? '',
            email: data["email"] ?? '',
            name: data["name"] ?? '',
        );
    }
}
