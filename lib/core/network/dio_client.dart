import 'package:dio/dio.dart';
import 'package:flutter_application_11/core/network/api_config.dart';
import 'package:flutter_application_11/data/api/post_api_client.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:get/get.dart';

class DioClient {
  static void prepareDio() {
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: ApiConfig.postsBaseUrl,
          headers: {
            AppStrings.contentTypeName: AppStrings.contentTypeValue,
            AppStrings.acceptName: AppStrings.acceptValue,
          },
          connectTimeout: const Duration(seconds: 30),
        ),
      ),
      fenix: true,
    );

    Get.lazyPut<PostApiClient>(() => PostApiClient(Get.find<Dio>()), fenix: true);
  }
}

