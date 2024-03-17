// ignore_for_file: unnecessary_cast, unused_import

import 'package:flutter/material.dart';
import 'custom_dialogue.dart';
import 'game_button.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage_sh extends StatefulWidget {
  const HomePage_sh({Key? key}) : super(key: key);

  @override
  State<HomePage_sh> createState() => _HomePage_shState();
}

class _HomePage_shState extends State<HomePage_sh> {
  late List<GameButton> buttonlist;
  var player1;
  var player2;
  var activePlayer;
  AudioPlayer player = AudioPlayer();

  Future<void> setAudio() async {
    await player.setSourceAsset("assets/audio/bac.mp3");
    await player.resume();
  }

  @override
  void initState() {
    super.initState();
    buttonlist = doInit();
    setAudio();
    player.onPlayerComplete.listen((event) async {
      await setAudio();
    });
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.blue;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;

      int checkWinner() {
        var winner = -1;
/*void resetGame(){
        //var canPop;
        if(Navigator.canPop(Context) => Navigator.pop(Context)){
        setState(() {
          buttonlist = doInit();
        });
      }
      }*/
        void resetGame() {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
            setState(() {
              buttonlist = doInit();
            });
          }
        }

        // row 1
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
          winner = 1;
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
          winner = 2;
        }

        // row 2
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
          winner = 1;
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
          winner = 2;
        }

        // row 3
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
          winner = 1;
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
          winner = 2;
        }

        // col 1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
          winner = 1;
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
          winner = 2;
        }

        // col 2
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
          winner = 1;
        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
          winner = 2;
        }

        // col 3
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
          winner = 1;
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
          winner = 2;
        }

        // diag 1
        if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
          winner = 1;
        }
        if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
          winner = 2;
        }

        // diag 2
        if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
          winner = 1;
        }
        if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
          winner = 2;
        }

        if (winner != -1) {
          if (winner == 1) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => CustomDialogue(
                    "X won",
                    "Press the reset button to start",
                    resetGame as VoidCallback));
          } else {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => CustomDialogue(
                    "O won",
                    "Press the reset button to start",
                    resetGame as VoidCallback));
          }
        } else {}
        return winner;
      }

      int winner = checkWinner();

      if (winner != -1) {
        void resetGame() {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
            setState(() {
              buttonlist = doInit();
            });
          }
        }

        if (winner == 1) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => CustomDialogue(
                  "X won",
                  "Press the reset button to start",
                  resetGame as VoidCallback));
        } else {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => CustomDialogue(
                  "O won",
                  "Press the reset button to start",
                  resetGame as VoidCallback));
        }
      } else {
        if (buttonlist.every((p) => p.text != "")) {
          void resetGame() {
            if (Navigator.canPop(context)) {
              // Navigator.pop(context);
              setState(() {
                buttonlist = doInit();
              });
            }
          }

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => CustomDialogue(
                  "Game Tied",
                  "Press the reset button to start",
                  resetGame as VoidCallback));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Season',
            color: Colors.black,
            fontSize: 55),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 9.0,
            ),
            itemCount: buttonlist.length,
            itemBuilder: (context, index) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: buttonlist[index].enabled
                      ? () => playGame(buttonlist[index])
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonlist[index].bg,
                    disabledBackgroundColor: buttonlist[index].bg,
                  ),
                  child: Text(
                    buttonlist[index].text,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}*/

class GameButton {
  late final int id;
  late String text;
  late Color bg;
  late bool enabled;

  GameButton({required this.id}) {
    text = "";
    bg = Colors.grey;
    enabled = true;
  }
}

class CustomDialogue extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback callback;

  CustomDialogue(this.title, this.content, this.callback);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            callback();
            Navigator.of(context).pop();
          },
          child: const Text('Reset'),
        ),
     ],
);
}
}