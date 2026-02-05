import 'package:flutter/material.dart';
import '../../core/base/base_controller.dart';
import '../../data/model/post_model.dart';

class PostController extends BaseController {
  PostController();

  final TextEditingController posttitleCtrl = TextEditingController();
  final TextEditingController postbodyCtrl = TextEditingController();

  List<PostModel> posts = [];
  String? errorMessage;
  bool postAdded = false;


  Future<void> getPosts() async {
    errorMessage = null;

    final result = await callApi<List<PostModel>>(
      restClient.getPosts(),
    );

    if (result != null) {
      posts = result;
    } else {
      errorMessage = 'Failed to load posts';
    }
    notifyListeners();
  }

  Future<bool> addPost() async {
    postAdded = false;
    errorMessage = null;

    final request = PostModel(
      userId: 1,
      title: posttitleCtrl.text.trim(),
      body: postbodyCtrl.text.trim(),
    );

    final result = await callApi<PostModel>(restClient.addPost(request));

    if (result != null) {
      posts.insert(0, result);
      debugPrint('Post Created: $result');
      posttitleCtrl.clear();
      postbodyCtrl.clear();
      postAdded = true;
      notifyListeners();
      return true;
    }

    return false;
  }

  void submitPost(BuildContext context) async {
    final success = await addPost();
    if (success && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Post added successfully!')));
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to add post')));
    }
  }

  void resetPostAddedFlag() {
    postAdded = false;
  }

  @override
  void dispose() {
    posttitleCtrl.dispose();
    postbodyCtrl.dispose();
    super.dispose();
  }
}
