import 'package:flutter/material.dart';

import 'features/register_product_screen/register_product_screen_page.dart';
import 'main_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
    );
  }
}

