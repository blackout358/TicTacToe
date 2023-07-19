import 'package:flutter/material.dart';
import 'package:tictactoe/logic/gameboard.dart';

import 'app_button.dart';

class Scoreboard extends StatefulWidget {
  final GameBoard myGameBoard;
  final String turn;
  const Scoreboard({super.key, required this.myGameBoard, required this.turn});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButtons(
          foregroundColor: Colors.red[300]!,
          backgroundColor: widget.myGameBoard.getTurn() == "X"
              ? const Color(0xFF9E9E9E)
              : const Color(0xFF757575),
          borderColor: Colors.black,
          text:
              "X: ${widget.myGameBoard.getXScore() == 0 ? "-" : widget.myGameBoard.getXScore()}",
          width: 130,
          height: 90,
          borderRadius: 15,
          onPressed: () {
            setState(() {
              widget.myGameBoard.setWinner("X");
            });
          },
          font: 0.04,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
        AppButtons(
          foregroundColor: Colors.blue[200]!,
          backgroundColor: widget.myGameBoard.getTurn() == "O"
              ? const Color(0xFF9E9E9E)
              : const Color(0xFF757575),
          borderColor: Colors.black,
          text:
              "O: ${widget.myGameBoard.getOScore() == 0 ? "-" : widget.myGameBoard.getOScore()}",
          width: 130,
          height: 90,
          borderRadius: 15,
          onPressed: () {
            setState(() {
              widget.myGameBoard.setWinner("X");
            });
          },
          font: 0.04,
        ),
      ],
    );
  }
}
