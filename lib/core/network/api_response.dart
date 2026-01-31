import 'http_status.dart';

class ApiResponse<T> {
  final T? data;
  final HttpStatusEnum status;
  final String? message;

  ApiResponse({
    this.data,
    required this.status,
    this.message,
  });
}
