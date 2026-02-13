import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:flutter_application_11/presentation/controller/add_post_controller.dart';
import 'package:get/get.dart';

class AddPostTab extends StatelessWidget {
  AddPostTab({super.key});

  final AddPostController addPostController = Get.find<AddPostController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: addPostController.posttitleCtrl),
          const SizedBox(height: 12),
          TextField(controller: addPostController.postbodyCtrl),
          const SizedBox(height: 16),

          Obx(() => ElevatedButton(
                onPressed: addPostController.isLoading.value
                    ? null
                    : addPostController.submitPost,
                child: addPostController.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text(AppStrings.addPostButton),
              )),
        ],
      ),
    );
  }
}