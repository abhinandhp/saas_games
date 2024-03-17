import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {

  void Function()? onPressed;
  IntroPage({super.key,required this.onPressed});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Center(
              child: Container(
                
                height: 240,
                child: Image.asset(
                  "lib/icons/gamepad.png",
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}