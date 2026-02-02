import '../datasource/post_remote_datasource.dart';
import '../model/post_model.dart';
import '../result/api_result.dart';

class PostRepository {
  final PostRemoteDataSource remote;

  PostRepository(this.remote);

  Future<ApiResult<List<PostModel>>> fetchPosts() async {
    try {
      final posts = await remote.getPosts();
      return ApiResult.success(posts);
    } catch (e) {
      return ApiResult.failure('Failed to load posts');
    }
  }

  Future<ApiResult<PostModel>> createPost(PostModel post) async {
    try {
      final result = await remote.addPost(post);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure('Failed to create post');
    }
  }
}