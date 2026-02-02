import '../api/post_api_service.dart';
import '../model/post_model.dart';

class PostRemoteDataSource {
  final PostApiService api;

  PostRemoteDataSource(this.api);

  Future<PostModel> addPost(PostModel post) {
    return api.addPost(post); // ✅ FIXED
  }

  Future<List<PostModel>> getPosts() {
    return api.getPosts();
  }
}