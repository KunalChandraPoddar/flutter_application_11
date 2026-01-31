import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/post_controller.dart';

class AddPostTab extends StatefulWidget {
  final VoidCallback onPostAdded;

  const AddPostTab({
    super.key,
    required this.onPostAdded,
  });

  @override
  State<AddPostTab> createState() => _AddPostTabState();
}

class _AddPostTabState extends State<AddPostTab> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PostController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await controller.addPost(
                titleController.text,
                bodyController.text,
              );

              titleController.clear();
              bodyController.clear();
              
              widget.onPostAdded();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post added successfully')),
              );
            },
            child: const Text('Add Post'),
          ),
        ],
      ),
    );
  }
}
