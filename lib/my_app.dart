import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/di/api_injector.dart';
import 'presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApiInjector.providePostController()..loadPosts(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
