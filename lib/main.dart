import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const GemStoreApp());
}

class GemStoreApp extends StatelessWidget {
  const GemStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'GemStore',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,

        fontFamily: 'Arial',

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff333333),
          brightness: Brightness.light,
        ),
      ),

      home: const HomePage(),
    );
  }
}