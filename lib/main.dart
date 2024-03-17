import 'package:flutter/material.dart';
import 'package:saas_game/choose/introtohome.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(``
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: IntroToHome(),
    );
  }
}