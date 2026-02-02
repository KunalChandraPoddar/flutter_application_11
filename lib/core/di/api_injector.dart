import 'package:flutter_application_11/data/datasource/post_remote_datasource.dart';
import '../network/dio_client.dart';
import '../../data/api/post_api_service.dart';
import '../../presentation/controller/post_controller.dart';
import '../../core/network/api_config.dart';

class ApiInjector {
  static PostController providePostController() {
    final dio = DioClient.create(ApiConfig.postsBaseUrl);
    final api = PostApiService(dio);
    final remote = PostRemoteDataSource(api);

    return PostController(remote);
  }
}