import 'package:twitter_clone/services/post.dart';
import 'package:twitter_clone/widgets/twitt_model.dart';
import 'package:get/get.dart';

class TwittController extends GetxController {
    static TwittController get instance => Get.find();
    final _twittRepo = Get.put(PostService());

    Future<List<TwittModel>?> getAllTwitts() async {
        return await _twittRepo.allTwitts();
    }
}

