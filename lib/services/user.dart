import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_clone/widgets/user.dart';

class UserService {
    Future<UserModel> userData(String id) async {
        try {
            final usrSnapshot = await FirebaseFirestore.instance.collection("users").where('id', isEqualTo: id)
                .get();
            if (usrSnapshot.docs.isNotEmpty) {
                return usrSnapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).single;
            }
            else {
                throw ('Error');
            }
        } catch (e) {
            rethrow;
        }
    }
}
