import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const AppHome(),
    );
  }
}
