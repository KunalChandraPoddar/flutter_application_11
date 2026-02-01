import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/post_controller.dart';

class AddPostTab extends StatefulWidget {
  const AddPostTab({super.key});

  @override
  State<AddPostTab> createState() => _AddPostTabState();
}

class _AddPostTabState extends State<AddPostTab> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<PostController>(
        builder: (context, controller, _) {
          return Column(
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
                onPressed: controller.loading
                    ? null
                    : () async {
                        final success = await controller.addPost(
                          titleController.text,
                          bodyController.text,
                        );

                        if (!context.mounted) return;

                        if (success) {
                          titleController.clear();
                          bodyController.clear();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Post added successfully'),
                            ),
                          );
                        }
                      },
                child: controller.loading
                    ? const CircularProgressIndicator()
                    : const Text('Add Post'),
              ),
            ],
          );
        },
      ),
    );
  }
}
