import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/api/post_api_client.dart';
import '../network/http_status.dart';
import 'package:get/get.dart';

typedef ApiErrorHandler = Future<bool> Function(DioException error);
  
class BaseController extends GetxController {
  final isLoading = false.obs;

  final PostApiClient restClient = Get.find<PostApiClient>();


  void setLoading(bool value) {
    isLoading.value = value;
  }

  Future<T?> callApi<T>(
    Future<T> request, {
    ApiErrorHandler? apiErrorHandler,
    bool showLoading = true,
  }) async {
    if (showLoading) setLoading(true);

    try {
      return await request;
    } on DioException catch (e) {
      final status = HttpStatusEnum.mapStatusCode(e.response?.statusCode);
      debugPrint('API Error → $status');

      if (apiErrorHandler != null) {
        final handled = await apiErrorHandler(e);
        if (!handled) await onResponseError(e);
      } else {
        await onResponseError(e);
      }
    } finally {
      if (showLoading) setLoading(false);
    }
    return null;
  }

  Future<void> onResponseError(DioException error) async {
    debugPrint(
      'Error ${error.response?.statusCode} → ${error.requestOptions.uri}',
    );
  }
}
