import 'package:flutter/material.dart';
import 'package:tictactoe/logic/gameboard.dart';

import 'app_button.dart';

class Scoreboard extends StatefulWidget {
  GameBoard myGameBoard;
  String turn;
  Scoreboard({super.key, required this.myGameBoard, required this.turn});

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
          foregroundColor: widget.myGameBoard.getTurn() == "X"
              ? Colors.red[300]!
              : Colors.purple[200]!,
          backgroundColor: widget.myGameBoard.getTurn() == "X"
              ? Color(0xFF9E9E9E)
              : Color(0xFF757575),
          borderColor: Colors.black,
          text: "X: ${widget.myGameBoard.getXScore()}",
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
        // AppButtons(
        //   foregroundColor: Colors.purple[200]!,
        //   backgroundColor: Color(0xFF757575),
        //   borderColor: Colors.black,
        //   text: widget.myGameBoard.getTurn(),
        //   width: 90,
        //   height: 90,
        //   borderRadius: 15,
        //   onPressed: () {
        //     setState(() {
        //       widget.myGameBoard.setWinner("X");
        //     });
        //   },
        // ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
        AppButtons(
          foregroundColor: widget.myGameBoard.getTurn() == "O"
              ? Colors.red[300]!
              : Colors.purple[200]!,
          backgroundColor: widget.myGameBoard.getTurn() == "O"
              ? Color(0xFF9E9E9E)
              : Color(0xFF757575),
          borderColor: Colors.black,
          text: "O: ${widget.myGameBoard.getOScore()}",
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
