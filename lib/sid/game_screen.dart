// ignore_for_file: depend_on_referenced_packages, use_super_parameters

/*import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hangman_original/consts/consts.dart';
import 'package:hangman_original/game/figure_widget.dart';
import 'package:hangman_original/game/hidden_letters.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  List<String> words = ["SHIFANA", "OPENAI", "FLUTTER", "GPT", "HANGMAN"];
  String word = ""; // Updated to be initialized later
  List<String> selectedChar = [];
  var tries = 0;

  @override
  void initState() {
    super.initState();
    loadRandomWord(); // Load random word when the game starts
  }

  void loadRandomWord() {
    final random = Random();
    word = words[random.nextInt(words.length)];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('HANGMAN'),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          Expanded( 
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      figure(GameUI.hang, tries >= 0),
                      figure(GameUI.head, tries >= 1),
                      figure(GameUI.body, tries >= 2),
                      figure(GameUI.leftarm, tries >= 3),
                      figure(GameUI.rightarm, tries >= 4),
                      figure(GameUI.leftleg, tries >= 5),
                      figure(GameUI.rightleg, tries >= 6),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: word.split("").map(
                        (e) => hiddenletter(e, selectedChar.contains(e.toUpperCase())),
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: characters.split("").map((e) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                    onPressed: selectedChar.contains(e.toUpperCase()) ? null : () {
                      setState(() {
                        selectedChar.add(e.toUpperCase());
                        if (!word.split("").contains(e.toUpperCase())) {
                          tries++;
                        }
                      });
                    },
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/

import 'dart:math';
import 'package:flutter/material.dart';

import 'consts/consts.dart';
import 'game/figure_widget.dart';
import 'game/hidden_letters.dart';


class Gamepage_2 extends StatefulWidget {
  const Gamepage_2({Key? key}) : super(key: key);

  @override
  State<Gamepage_2> createState() => _Gamepage_2State();
}

class _Gamepage_2State extends State<Gamepage_2> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  List<String> words = ["CGPA", "VIRGIN", "FLUTTER", "HUGE", "HOPE"];
  String word = ""; // Updated to be initialized later
  List<String> selectedChar = [];
  var tries = 0;
  bool gameOver = false;
  bool playerWon = false;

  @override
  void initState() {
    super.initState();
    loadRandomWord(); // Load random word when the game starts
  }

  void loadRandomWord() {
    final random = Random();
    word = words[random.nextInt(words.length)];
  }

  void checkGameStatus() {
    gameOver = tries >= 6;
    playerWon = word
        .split("")
        .every((char) => selectedChar.contains(char.toUpperCase()));
    if (gameOver || playerWon) {
      setState(() {}); // Trigger a rebuild to update UI based on game status
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('HANGMAN'),
        backgroundColor: Colors.black12,
      ),
      body: Stack(
        
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          figure(GameUI.hang, tries >= 0),
                          figure(GameUI.head, tries >= 1),
                          figure(GameUI.body, tries >= 2),
                          figure(GameUI.leftarm, tries >= 3),
                          figure(GameUI.rightarm, tries >= 4),
                          figure(GameUI.leftleg, tries >= 5),
                          figure(GameUI.rightleg, tries >= 6),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: word
                              .split("")
                              .map(
                                (e) => hiddenletter(
                                    e, selectedChar.contains(e.toUpperCase())),
                              )
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    physics: gameOver || playerWon
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    crossAxisCount: 7,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: characters.split("").map((e) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        onPressed: gameOver ||
                                playerWon ||
                                selectedChar.contains(e.toUpperCase())
                            ? null
                            : () {
                                setState(() {
                                  selectedChar.add(e.toUpperCase());
                                  if (!word
                                      .split("")
                                      .contains(e.toUpperCase())) {
                                    tries++;
                                  }
                                  checkGameStatus();
                                });
                              },
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
          if (gameOver || playerWon)
            Center(
              child: Container(
                color: Color.fromARGB(0, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      gameOver ? 'GAME OVER' : 'CONGRATULATIONS, YOU WON!',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tries = 0;
                          selectedChar.clear();
                          loadRandomWord();
                          gameOver = false;
                          playerWon = false;
                        });
                      },
                      child: Text(
                        'PLAY AGAIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
