import 'package:cloud_firestore/cloud_firestore.dart';

class TwittModel {
    final String? id;
    final String creator;
    final String text;
    final Timestamp timestamp;

    TwittModel({this.id, required this.creator, required this.text, required this.timestamp});

    factory TwittModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
        final data = document.data()!;
        return TwittModel( 
            id: document.id,
            creator: data["creator"],
            text: data["text"],
            timestamp: data["timestamp"],
        );
    }
}


