// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tictactoe/logic/gameboard.dart';
import 'package:tictactoe/widgets/scoreboard.dart';
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

  void updateWinner(String winner) {
    setState(() {
      this.winner = winner;
      turn = turn;
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
              myGameBoard: myGameBoard,
              updateWinner: updateWinner,
            ),
          ),
          Scoreboard(
            myGameBoard: myGameBoard,
            turn: turn,
          ),
          const Padding(padding: EdgeInsets.all(4)),
          WinnerText(myGameBoard: myGameBoard, winner: winner),
        ],
      ),
    );
  }
}
