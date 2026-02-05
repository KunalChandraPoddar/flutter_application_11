import 'package:flutter/material.dart';
import '../controller/post_controller.dart';

class PostsTab extends StatefulWidget {
  final PostController controller;
  const PostsTab({super.key, required this.controller});

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        if (widget.controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (widget.controller.errorMessage != null) {
          return Center(child: Text(widget.controller.errorMessage!));
        }

        return RefreshIndicator(
          onRefresh: widget.controller.getPosts,
          child: ListView.builder(
            itemCount: widget.controller.posts.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(widget.controller.posts[i].title),
              subtitle: Text(widget.controller.posts[i].body),
            ),
          ),
        );
      },
    );
  }
}