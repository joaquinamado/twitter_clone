import 'package:twitter_clone/services/user.dart';
import 'package:twitter_clone/widgets/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
    static UserController get instance => Get.find();
    final _userRepo = Get.put(UserService());

    Future<UserModel> getUserData(String id) async {
        return await _userRepo.userData(id);
    }
}
