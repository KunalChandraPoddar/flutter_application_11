import 'package:flutter/material.dart';
import 'package:flutter_application_11/presentation/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import '../tabs/posts_tab.dart';
import '../tabs/add_post_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PostController postController = Get.find<PostController>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      PostsTab(),
      AddPostTab(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle), 
      backgroundColor: Colors.blue,),

      body: Obx(() => tabs[homeController.currentIndex.value]),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: homeController.currentIndex.value,
            onTap: homeController.changeTab,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: AppStrings.postsTabLabel),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: AppStrings.addPostTabLabel),
            ],
          )),
    );
  }
}