import 'package:flutter/material.dart';
import '../../data/model/post_model.dart';
import '../../data/repository/post_repository.dart';

class PostController extends ChangeNotifier {
  final PostRepository repository;

  PostController(this.repository);

  List<PostModel> posts = [];
  bool loading = false;

  Future<void> loadPosts() async {
    loading = true;
    notifyListeners();

    final response = await repository.fetchPosts();
    posts = response.data ?? [];

    loading = false;
    notifyListeners();
  }

  Future<void> addPost(String title, String body) async {
    final response = await repository.createPost(
      PostModel(userId: 1, title: title, body: body),
    );

    if (response.data != null) {
      posts.insert(0, response.data!);
      notifyListeners();
    }
  }
}
