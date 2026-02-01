import 'package:flutter/material.dart';
import '../../data/model/post_model.dart';
import '../../data/repository/post_repository.dart';

class PostController extends ChangeNotifier {
  final PostRepository repository;

  PostController(this.repository);

  List<PostModel> posts = [];
  bool loading = false;

  bool shouldGoToPostsTab = false;

  Future<void> loadPosts() async {
    loading = true;
    notifyListeners();

    final response = await repository.fetchPosts();
    posts = response.data ?? [];

    loading = false;
    notifyListeners();
  }

  Future<bool> addPost(String title, String body) async {
    loading = true;
    notifyListeners();

    final response = await repository.createPost(
      PostModel(userId: 1, title: title, body: body),
    );

    loading = false;

    if (response.data != null) {
      posts.insert(0, response.data!);
      shouldGoToPostsTab = true;
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }

  void resetNavigationFlag() {
    shouldGoToPostsTab = false;
  }
}
