import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import '../tabs/posts_tab.dart';
import '../tabs/add_post_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PostController controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      PostsTab(),
      AddPostTab(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle), 
      backgroundColor: Colors.blue,),

      body: Obx(() => tabs[controller.currentIndex.value]),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) => controller.currentIndex.value = index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'Posts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Add Post'),
            ],
          )),
    );
  }
}