import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/post_controller.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostController>();

    if (controller.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.posts.isEmpty) {
      return const Center(child: Text('No posts found'));
    }

    return ListView.separated(
      itemCount: controller.posts.length,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (_, index) {
        final post = controller.posts[index];
        return ListTile(
          title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(post.body),
        );
      },
    );
  }
}
