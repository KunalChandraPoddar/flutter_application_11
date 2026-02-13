import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/base/base_controller.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:flutter_application_11/data/model/post_model.dart';
import 'package:flutter_application_11/presentation/controller/home_controller.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import 'package:get/get.dart';

class AddPostController extends BaseController {

  final postAdded = false.obs;

  final posttitleCtrl = TextEditingController();
  final postbodyCtrl = TextEditingController();


  Future<bool> addPost() async {
    postAdded.value = false;

    final request = PostModel(
      userId: 1,
      title: posttitleCtrl.text.trim(),
      body: postbodyCtrl.text.trim(),
    );

    final result = await callApi<PostModel>(restClient.addPost(request));

    if (result != null) {
      final postController = Get.find<PostController>();
      postController.posts.insert(0, result);
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
      final homeController = Get.find<HomeController>();
      homeController.currentIndex.value = 0;
      Get.snackbar(
        AppStrings.snackbarSuccessHeading,
        AppStrings.snackbarSuccessMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        AppStrings.snackbarErrorHeading,
        AppStrings.snackbarErrorMessage,
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