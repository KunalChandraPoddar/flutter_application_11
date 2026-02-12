import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:get/get.dart';
import '../controller/post_controller.dart';

class PostsTab extends StatelessWidget {
  PostsTab({super.key});

  final PostController controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.value != null) {
        return Center(child: Text(controller.errorMessage.value!));
      }

      if (controller.posts.isEmpty) {
        return const Center(child: Text(AppStrings.noPosts));
      }

      return ListView.builder(
        itemCount: controller.posts.length,
        itemBuilder: (_, i) {
          final post = controller.posts[i];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      );
    });
  }
}