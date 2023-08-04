import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/twitt_model.dart';


class PostService {

    Future savePost(text) async {
        await FirebaseFirestore.instance.collection("post").add({
        'text': text,
        'creator': FirebaseAuth.instance.currentUser!.uid,
        'timestamp': FieldValue.serverTimestamp(),
        });
    }

    Future<List<TwittModel>?> allTwitts() async {
        try {
            final twittSnapshot = await FirebaseFirestore.instance.collection("post")
                .orderBy('timestamp', descending: true)
                .get();
            if (twittSnapshot.docs.isNotEmpty) {
                return twittSnapshot.docs.map((doc) => TwittModel.fromSnapshot(doc)).toList();
            }
            else {
                return null;
            }
        } catch (e) {
            rethrow;
        }
    }
}
