import 'package:flutter/material.dart';
import 'package:saas_game/pages/homepage.dart';
import 'package:saas_game/pages/intropage.dart';

class IntroToHome extends StatefulWidget {
  const IntroToHome({super.key});

  @override
  State<IntroToHome> createState() => _IntroToHomeState();
}

class _IntroToHomeState extends State<IntroToHome> {
  bool showintro=true;
  void toggle(){
    setState(() {
      showintro=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showintro)
      return IntroPage(onPressed: toggle,);
    else return HomePage();
  }
}