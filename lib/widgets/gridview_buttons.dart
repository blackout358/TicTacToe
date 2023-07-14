import 'package:flutter/material.dart';
import 'package:tictactoe/logic/gameboard.dart';
import 'package:tictactoe/logic/win_checker.dart';
import 'package:tictactoe/widgets/app_button.dart';

class ButtonGrid extends StatefulWidget {
  final ValueChanged<String> onPressed;
  String turn;
  String winner;
  List<String> displayXO;
  GameBoard myGameBoard;
  ButtonGrid({
    super.key,
    required this.turn,
    required this.onPressed,
    required this.displayXO,
    required this.winner,
    required this.myGameBoard,
  });

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

// List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

class _ButtonGridState extends State<ButtonGrid> {
  bool hasWon = false;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AppButtons(
          foregroundColor: Colors.red,
          backgroundColor: Colors.grey[300]!,
          borderColor: Colors.black,
          text: widget.myGameBoard.getGridValue(index),
          width: 10,
          height: 10,
          borderRadius: 35,
          onPressed: () {
            setState(() {
              if (hasWon) {
                widget.myGameBoard.clearBoard();
                hasWon = !hasWon;
              }
              widget.myGameBoard.setXO(index);
              var (didWin, whoWin) = widget.myGameBoard.isWinner();
              if (didWin) {
                hasWon = true;
                widget.winner = "$whoWin is the winner!";
              }
              print(widget.myGameBoard.getGrid());
            });
          },
        );
      },
    );
  }

  void checkWinner() {
    widget.winner = WinnerChecker.checkWinner(widget.displayXO);
    setState(() {});
  }
}
