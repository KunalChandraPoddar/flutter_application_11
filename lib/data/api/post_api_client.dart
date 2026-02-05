import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/post_model.dart';

part 'post_api_client.g.dart';

@RestApi()
abstract class PostApiClient {
  factory PostApiClient(Dio dio) = _PostApiClient;

  @GET('/posts')
  Future<List<PostModel>> getPosts();

  @POST('/posts')
  Future<PostModel> addPost(@Body() PostModel post);
}