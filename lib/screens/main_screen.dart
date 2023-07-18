import 'package:flutter/material.dart';
import 'package:tictactoe/logic/gameboard.dart';
import 'package:tictactoe/widgets/app_button.dart';
import 'package:tictactoe/widgets/winner_text.dart';
import '../widgets/gridview_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String turn = "X";
  String winner = "";
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  GameBoard myGameBoard = GameBoard();

  void setTurn(String value) {
    setState(() {
      winner = myGameBoard.getWinner();
    });
  }

  void updateWinner(String winner) {
    setState(() {
      this.winner = winner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 500,
            child: ButtonGrid(
              turn: turn,
              onPressed: () {},
              displayXO: displayXO,
              winner: winner,
              myGameBoard: myGameBoard,
              updateWinner: updateWinner,
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButtons(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                text: "X",
                width: 90,
                height: 90,
                borderRadius: 15,
                onPressed: () {
                  setState(() {
                    turn = "X";
                  });
                },
              ),
              AppButtons(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                text: turn,
                width: 90,
                height: 90,
                borderRadius: 15,
                onPressed: () {
                  setState(() {
                    myGameBoard.clearBoard();
                    myGameBoard.setWinner("");
                    updateWinner("");
                  });
                },
              ),
              AppButtons(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                text: "O",
                width: 90,
                height: 90,
                borderRadius: 15,
                onPressed: () {
                  print("myGameBoard: ${myGameBoard.getWinner()}");
                  print("Winner: $winner");
                },
              ),
            ],
          ),
          WinnerText(myGameBoard: myGameBoard, winner: winner),
        ],
      ),
    );
  }
}
