import '../../core/network/http_status.dart';

class ApiResult<T> {
  final T? data;
  final String? message;
  final HttpStatusEnum status;

  ApiResult({
    required this.status,
    this.data,
    this.message,
  });

  bool get isSuccess => status == HttpStatusEnum.success;
}
