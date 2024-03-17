import 'package:flutter/material.dart';
import 'package:saas_game/arjun/main_arj.dart';
import 'package:saas_game/model/game.dart';
import 'package:saas_game/pages/gamepages/gamepage4.dart';
import 'package:saas_game/shifana/gamepage_1.dart';

import 'gamepages/gamepage1.dart';
import 'gamepages/gamepage2.dart';
import 'gamepages/gamepage3.dart';
import 'package:saas_game/sid/game_screen.dart';

class GamePage extends StatelessWidget {
  final Game game;
   GamePage({super.key,required this.game});

  final List<Widget> _gamepages=[
    HomePage_sh(),

    Gamepage_2(),

    Gamepage_3(title: ' ',),

    GamePage4(),


  ];

  double wid=80;
  void changewidth(int index){
    if(index!=0||index!=1){
      wid=10;
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:  Container(
                    margin: EdgeInsets.only(left: 10,top: 25),
                    height: 40,
                    child: Icon(
                      Icons.arrow_back,
                      size: 55,
                      ),
                  )),
              ],
            ),
            SizedBox(height: 75,),
            Column(
              
              children: [
                Row(
                  children: [
                    SizedBox(width: game.width,),
                    Image.asset(
                      game.imagepath,
                      height: 300,
                      ),
                  ],
                ),
                
                  SizedBox(height: 35,),
                  Text(
                    game.name,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontFamily:'Season'
                    ),
                    ),
                    SizedBox(height: 35,),
                    GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => _gamepages[game.index]));
                  },
                  child:  Container(
                    
                    
                    child: Row(
                      children: [
                        SizedBox(width: 140,),
                        Image.asset(
                          'lib/icons/play.png',
                          height: 160,
                          ),
                        
                      ],
                    )
                  )),

              ],
            ),
          ],
        ),
      )
    );
  }
}