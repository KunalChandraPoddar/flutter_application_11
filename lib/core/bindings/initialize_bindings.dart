import 'package:flutter_application_11/core/network/dio_client.dart';
import 'package:get/get.dart';

class InitializeBindings extends Bindings {
  @override
  void dependencies() {
    DioClient.prepareDio();
  }
}