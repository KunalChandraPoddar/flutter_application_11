import '../network/dio_client.dart';
import '../../data/api/post_api_service.dart';
import '../../data/repository/post_repository.dart';
import '../../presentation/controller/post_controller.dart';
import '../../core/network/api_config.dart';

class ApiInjector {
  static PostController providePostController() {
    final dio = DioClient.create(ApiConfig.postsBaseUrl);
    final api = PostApiService(dio);
    final repo = PostRepository(api);

    return PostController(repo);
  }
}
