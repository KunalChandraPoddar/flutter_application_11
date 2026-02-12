import 'package:dio/dio.dart';
import 'package:flutter_application_11/core/network/api_config.dart';
import 'package:flutter_application_11/data/api/post_api_client.dart';
import 'package:get/get.dart';

class InitializeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(
      Dio(
        BaseOptions(
          baseUrl: ApiConfig.postsBaseUrl,
          headers: {'Content-Type': 'application/json'},
        ),
      ),
      permanent: true,
    );

    Get.put<PostApiClient>(
      PostApiClient(Get.find<Dio>()), 
      permanent: true);
  }
}
