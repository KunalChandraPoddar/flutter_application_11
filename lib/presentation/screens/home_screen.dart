import 'package:flutter/material.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import 'package:provider/provider.dart';
import '../tabs/posts_tab.dart';
import '../tabs/add_post_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  late final PostController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<PostController>();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void goToPostsTab() {
    setState(() {
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      PostsTab(controller: controller),
      AddPostTab(
        controller: controller,
        onPostAdded: () {
          setState(() {
            currentIndex = 0;
          });
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Posts App')),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Post'),
        ],
      ),
    );
  }
}