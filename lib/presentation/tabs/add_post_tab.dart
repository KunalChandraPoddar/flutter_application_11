import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import 'package:get/get.dart';

class AddPostTab extends StatelessWidget {
  AddPostTab({super.key});

  final PostController controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: controller.posttitleCtrl),
          const SizedBox(height: 12),
          TextField(controller: controller.postbodyCtrl),
          const SizedBox(height: 16),

          Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.submitPost,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text(AppStrings.addPostButton),
              )),
        ],
      ),
    );
  }
}