import 'package:flutter/material.dart';
import 'package:tictactoe/logic/gameboard.dart';
import 'package:tictactoe/widgets/app_button.dart';
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
              onPressed: (String value) {
                setTurn(value);
                setState(() {
                  winner = myGameBoard.getWinner();
                });
              },
              displayXO: displayXO,
              winner: winner,
              myGameBoard: myGameBoard,
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
                  print(myGameBoard.getWinner());
                  print(winner);
                },
              ),
            ],
          ),
          Text(
            myGameBoard.getWinner(),
            style: TextStyle(
              fontSize: 50,
              color: Colors.blue[400],
            ),
          ),
        ],
      ),
    );
  }
}
