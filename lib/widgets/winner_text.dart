import 'package:flutter/material.dart';

import '../logic/gameboard.dart';

class WinnerText extends StatefulWidget {
  GameBoard myGameBoard;
  String winner;
  WinnerText({
    super.key,
    required this.myGameBoard,
    required this.winner,
  });

  @override
  State<WinnerText> createState() => _WinnerTextState();
}

class _WinnerTextState extends State<WinnerText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.myGameBoard.getWinner(),
      style: TextStyle(
        fontSize: 50,
        color: Colors.blue[400],
      ),
    );
  }
}
