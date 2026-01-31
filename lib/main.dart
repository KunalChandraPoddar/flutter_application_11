import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/di/api_injector.dart';
import 'package:flutter_application_11/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppInjector.providers,
      child: const MyApp(),
    ),
  );
}
