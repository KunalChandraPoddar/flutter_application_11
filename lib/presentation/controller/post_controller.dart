import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../core/base/base_controller.dart';
import '../../data/datasource/post_remote_datasource.dart';
import '../../data/model/post_model.dart';

class PostController extends BaseController with ChangeNotifier {
  final PostRemoteDataSource remoteDataSource;

  PostController(this.remoteDataSource);

  bool loading = false;
  List<PostModel> posts = [];

  Future<void> loadPosts() async {
    loading = true;
    notifyListeners();

    try {
      final response = await remoteDataSource.getPosts();
      posts = response;
    } on DioException catch (e) {
      handleError<List<PostModel>>(e);
    }

    loading = false;
    notifyListeners();
  }

  Future<bool> addPost(String title, String body) async {
    loading = true;
    notifyListeners();

    try {
      final post = PostModel(
        title: title,
        body: body,
        userId: 1,
      );

      final createdPost = await remoteDataSource.addPost(post);

      posts.insert(0, createdPost);
      loading = false;
      notifyListeners();

      return true;
    } on DioException catch (e) {
      loading = false;
      notifyListeners();
      handleError<PostModel>(e);
      return false;
    }
  }
}
