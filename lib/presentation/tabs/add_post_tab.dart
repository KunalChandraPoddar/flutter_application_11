import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/post_controller.dart';

class AddPostTab extends StatelessWidget {
  final VoidCallback onPostAdded;

  const AddPostTab({super.key, required this.onPostAdded});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
          const SizedBox(height: 12),
          TextField(controller: bodyController, decoration: const InputDecoration(labelText: 'Body')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final success = await context
                  .read<PostController>()
                  .addPost(titleController.text, bodyController.text);

              if (success) {
                onPostAdded();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post added successfully')),
                );
              }
            },
            child: const Text('Add Post'),
          ),
        ],
      ),
    );
  }
}
