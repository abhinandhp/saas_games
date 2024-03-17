import 'package:flutter/material.dart';
import 'package:saas_game/model/game.dart';
import 'package:saas_game/pages/gamepage.dart';


class GameTile extends StatelessWidget {
  final Game game;
  GameTile({super.key,required this.game});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GamePage(game: game) ));
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(left: 30,right:30,bottom: 25),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
          child: Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              
              title: Text(
                game.name,
                style: TextStyle(
                  color: Colors.black,
                fontFamily:'Funkrocker',
                letterSpacing: 3,
                fontSize: 30),
                ),
              leading: Image.asset(
                game.imagepath,
                ),
              
            ),
          ),
        ),
      ),
    );
  }
}