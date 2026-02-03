import 'package:dio/dio.dart';
import '../datasource/post_remote_datasource.dart';
import '../model/post_model.dart';
import '../result/api_result.dart';
import '../../core/network/http_status.dart';

class PostRepository {
  final PostRemoteDataSource remote;

  PostRepository(this.remote);

  Future<ApiResult<List<PostModel>>> fetchPosts() async {
    try {
      final posts = await remote.getPosts();
      return ApiResult(
        status: HttpStatusEnum.success,
        data: posts,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return ApiResult(
          status: HttpStatusEnum.networkError,
          message: 'No internet connection',
        );
      }

      if (e.response != null && e.response!.statusCode! >= 500) {
        return ApiResult(
          status: HttpStatusEnum.serverError,
          message: 'Server error',
        );
      }

      return ApiResult(
        status: HttpStatusEnum.clientError,
        message: 'Invalid request',
      );
    } catch (_) {
      return ApiResult(
        status: HttpStatusEnum.unknownError,
        message: 'Something went wrong',
      );
    }
  }

  Future<ApiResult<PostModel>> createPost(PostModel post) async {
    try {
      final createdPost = await remote.addPost(post);
      return ApiResult(
        status: HttpStatusEnum.success,
        data: createdPost,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return ApiResult(
          status: HttpStatusEnum.networkError,
          message: 'No internet connection',
        );
      }

      if (e.response != null && e.response!.statusCode! >= 500) {
        return ApiResult(
          status: HttpStatusEnum.serverError,
          message: 'Server error',
        );
      }

      return ApiResult(
        status: HttpStatusEnum.clientError,
        message: 'Failed to create post',
      );
    } catch (_) {
      return ApiResult(
        status: HttpStatusEnum.unknownError,
        message: 'Unexpected error',
      );
    }
  }
}
