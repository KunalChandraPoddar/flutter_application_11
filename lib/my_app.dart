import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/bindings/initialize_bindings.dart';
import 'package:flutter_application_11/data/constants/app_strings.dart';
import 'package:get/get.dart';
import 'package:flutter_application_11/presentation/routes/app_pages.dart';
import 'package:flutter_application_11/presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitializeBindings(),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.homePage,
      getPages: AppPages.pages,
    );
  }
}