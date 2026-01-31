import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../network/dio_client.dart';
import '../../data/api/post_api_service.dart';
import '../../data/repository/post_repository.dart';
import '../../presentation/controller/post_controller.dart';

class AppInjector {
  static List<SingleChildWidget> providers = [
    Provider(
      create: (_) => DioClient.getDio(),
    ),

    Provider(
      create: (context) =>
          PostApiService(context.read()),
    ),

    Provider(
      create: (context) =>
          PostRepository(context.read()),
    ),

    ChangeNotifierProvider(
      create: (context) =>
          PostController(context.read())..loadPosts(),
    ),
  ];
}
