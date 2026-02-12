import '../api/post_api_client.dart';
import '../model/post_model.dart';

class PostRemoteDataSource {
  final PostApiClient api;

  PostRemoteDataSource(this.api);

  Future<List<PostModel>> getPosts() => api.getPosts();

  Future<PostModel> addPost(PostModel post) => api.addPost(post);
}