import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/di/api_injector.dart';
import 'package:flutter_application_11/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ApiInjector.providePostController()..loadPosts(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}