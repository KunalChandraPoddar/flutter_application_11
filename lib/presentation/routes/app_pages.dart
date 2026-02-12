import 'package:flutter_application_11/core/bindings/post_binding.dart';
import 'package:flutter_application_11/presentation/routes/app_routes.dart';
import 'package:flutter_application_11/presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
    name: AppRoutes.homePage,
    page: () => HomeScreen(),
    binding: PostBinding(),),
  ];
}