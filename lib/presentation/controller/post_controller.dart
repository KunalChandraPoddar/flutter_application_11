import 'package:flutter/material.dart';
import '../../data/model/post_model.dart';
import '../../data/repository/post_repository.dart';

class PostController extends ChangeNotifier {
  final PostRepository repository;

  PostController(this.repository);

  bool loading = false;
  List<PostModel> posts = [];
  String? errorMessage;

  Future<void> loadPosts() async {
    loading = true;
    errorMessage = null;
    notifyListeners();

    final result = await repository.fetchPosts();

    if (result.isSuccess) {
      posts = result.data!;
    } else {
      errorMessage = result.message;
    }

    loading = false;
    notifyListeners();
  }

  Future<bool> addPost(String title, String body) async {
    final result = await repository.createPost(
      PostModel(
        title: title,
        body: body,
        userId: 1,
      ),
    );

    if (result.isSuccess) {
      posts.insert(0, result.data!);
      notifyListeners();
      return true;
    } else {
      errorMessage = result.message;
      notifyListeners();
      return false;
    }
  }
}
