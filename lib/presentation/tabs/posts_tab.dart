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
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final post = controller.posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
          leading: CircleAvatar(
            child: Text(post.id.toString()),
          ),
        );
      },
    );
  }
}