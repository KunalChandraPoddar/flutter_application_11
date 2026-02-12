// import 'package:dio/dio.dart';
// import 'package:flutter_application_11/core/network/api_config.dart';
// import 'package:flutter_application_11/data/api/post_api_client.dart';

// class DioClient {
//   static Dio create(String baseUrl) {
//     return Dio(
//       BaseOptions(
//         baseUrl: baseUrl,
//         headers: {'Content-Type': 'application/json'},
//       ),
//     );
//   }

//   static PostApiClient getRestClient() {
//     final baseUrl = ApiConfig.postsBaseUrl;
//     final dio = create(baseUrl);
//     return PostApiClient(dio);
//   }
// }