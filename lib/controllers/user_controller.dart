import 'package:get/get.dart';
import '../services/user.dart';
import '../models/user.dart';

class UserController extends GetxController {
    static UserController get instance => Get.find();
    final _userRepo = Get.put(UserService());

    Future<UserModel> getUserData(String id) async {
        return await _userRepo.userData(id);
    }
}
