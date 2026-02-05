import 'package:flutter/material.dart';
import 'package:flutter_application_11/presentation/controller/post_controller.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostController()..getPosts(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
