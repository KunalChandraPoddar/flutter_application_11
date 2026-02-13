import 'package:dio/dio.dart';
import 'package:flutter_application_11/core/network/api_config.dart';
import 'package:flutter_application_11/data/api/post_api_client.dart';
import 'package:get/get.dart';

class DioClient {
  static void prepareDio() {
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: ApiConfig.postsBaseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          connectTimeout: const Duration(seconds: 30),
        ),
      ),
      fenix: true,
    );

    Get.lazyPut<PostApiClient>(() => PostApiClient(Get.find<Dio>()), fenix: true);
  }
}

