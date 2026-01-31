import 'package:dio/dio.dart';
import 'package:flutter_application_11/core/network/http_status.dart';
import '../../core/base/base_controller.dart';
import '../../core/network/api_response.dart';
import '../api/post_api_service.dart';
import '../model/post_model.dart';

class PostRepository extends BaseController {
  final PostApiService api;

  PostRepository(this.api);

  Future<ApiResponse<List<PostModel>>> fetchPosts() async {
    try {
      final response = await api.getPosts();
      return ApiResponse(
        data: response,
        status: HttpStatusEnum.success,
      );
    } on DioException catch (e) {
      return handleError(e);
    }
  }

  Future<ApiResponse<PostModel>> createPost(PostModel post) async {
    try {
      final response = await api.addPost(post);
      return ApiResponse(
        data: response,
        status: HttpStatusEnum.created,
      );
    } on DioException catch (e) {
      return handleError(e);
    }
  }
}
