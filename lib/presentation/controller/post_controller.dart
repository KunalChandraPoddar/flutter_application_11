import 'package:flutter_application_11/data/constants/app_strings.dart';
import '../../core/base/base_controller.dart';
import '../../data/model/post_model.dart';
import 'package:get/get.dart';

class PostController extends BaseController {

  final posts = <PostModel>[].obs;
  final errorMessage = RxnString();


  final post = Rxn<PostModel>();

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  Future<void> getPosts() async {
    errorMessage.value = null;

    final result = await callApi<List<PostModel>>(restClient.getPosts());

    if (result != null) {
      posts.assignAll(result);
    } else {
      errorMessage.value = AppStrings.errorMessage;
    }
  }
}
