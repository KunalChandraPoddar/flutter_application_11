import '../../core/network/dio_client.dart';
import '../../core/network/api_config.dart';
import '../../data/api/post_api_service.dart';
import '../../data/datasource/post_remote_datasource.dart';
import '../../data/repository/post_repository.dart';
import '../../presentation/controller/post_controller.dart';

class ApiInjector {
  static PostController providePostController() {
    final dio = DioClient.create(ApiConfig.postsBaseUrl);
    final api = PostApiService(dio);
    final remote = PostRemoteDataSource(api);
    final repository = PostRepository(remote);

    return PostController(repository);
  }
}
