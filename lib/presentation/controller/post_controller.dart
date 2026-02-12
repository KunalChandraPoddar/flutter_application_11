import 'package:flutter/material.dart';
import '../../core/base/base_controller.dart';
import '../../data/model/post_model.dart';
import 'package:get/get.dart';

class PostController extends BaseController {
  PostController();

  final posts = <PostModel>[].obs;
  final errorMessage = RxnString();
  final postAdded = false.obs;

  final posttitleCtrl = TextEditingController();
  final postbodyCtrl = TextEditingController();

  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

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
      errorMessage.value = "Failed to load posts";
    }
  }

  Future<bool> addPost() async {
    postAdded.value = false;

    final request = PostModel(
      userId: 1,
      title: posttitleCtrl.text.trim(),
      body: postbodyCtrl.text.trim(),
    );

    final result = await callApi<PostModel>(restClient.addPost(request));

    if (result != null) {
      posts.insert(0, result);
      posttitleCtrl.clear();
      postbodyCtrl.clear();
      postAdded.value = true;
      return true;
    }
    return false;
  }

  Future<void> submitPost() async {
    final success = await addPost();

    if (success) {
      currentIndex.value = 0;
      Get.snackbar(
        "Success",
        "Post added successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Error",
        "Failed to add post",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resetPostAddedFlag() {
    postAdded.value = false;
  }

  @override
  void dispose() {
    posttitleCtrl.dispose();
    postbodyCtrl.dispose();
    super.dispose();
  }
}
