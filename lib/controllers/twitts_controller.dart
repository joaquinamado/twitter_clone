import 'package:get/get.dart';
import '../services/post.dart';
import '../models/twitt_model.dart';

class TwittController extends GetxController {
    static TwittController get instance => Get.find();
    final _twittRepo = Get.put(PostService());

    Future<List<TwittModel>?> getAllTwitts() async {
        return await _twittRepo.allTwitts();
    }
}

