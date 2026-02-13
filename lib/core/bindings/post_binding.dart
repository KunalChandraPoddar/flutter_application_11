import 'package:flutter_application_11/presentation/controller/add_post_controller.dart';
import 'package:flutter_application_11/presentation/controller/home_controller.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AddPostController>(() => AddPostController());
  }
}