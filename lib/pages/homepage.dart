import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saas_game/model/game.dart';

import '../models/gametile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Game> _games=[
    Game(name: '  Tic tac toe', imagepath: 'lib/icons/tic.png', index: 0,width: 80),

    Game(name: '   Hangman', imagepath: 'lib/icons/hangman.png',index: 1,width: 78),

    Game(name: '   Dino Run', imagepath: 'lib/icons/dino.png',index: 2,width: 53),

    Game(name: '   Space Invaders', imagepath: 'lib/icons/space2.png',index: 3,width: 53)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 15,),
            GestureDetector(
            onTap: (){},
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 35,bottom: 0),
                padding: EdgeInsets.all(2),
                height: 70,
                child: Image.asset(
                  "lib/icons/set1.png",),
              ),
            ),
          ),
           SizedBox(width: 240,),
            GestureDetector(
            onTap: (){},
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 35,bottom: 0),
                padding: EdgeInsets.all(2),
                height: 60,
                child: Image.asset(
                  "lib/icons/info.png",
                  color: Colors.white,),
              ),
            ),
          )
          ],),
          SizedBox(height: 2,),
          Expanded(
            child: ListView.builder(
              itemCount: _games.length,
              itemBuilder: (context,index){
              Game eachgame=_games[index];
              return GameTile(game: eachgame);
            }),
          )
        ],
      ),
    );
  }
}