import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/post_controller.dart';

class AddPostTab extends StatefulWidget {
  final VoidCallback onPostAdded;

  const AddPostTab({super.key, required this.onPostAdded});

  @override
  State<AddPostTab> createState() => _AddPostTabState();
}

class _AddPostTabState extends State<AddPostTab> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<PostController>(
        builder: (context, controller, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: controller.loading
                    ? null
                    : () async {
                        final success = await controller.addPost(
                          titleController.text,
                          bodyController.text,
                        );

                        if (!context.mounted) return;

                        if (success) {
                          widget.onPostAdded();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Post added successfully'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to add post')),
                          );
                        }
                      },
                child: controller.loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Add Post'),
              ),
            ],
          );
        },
      ),
    );
  }
}
