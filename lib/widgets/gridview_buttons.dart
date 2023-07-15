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
                // widget.myGameBoard.setWinner("");
                hasWon = !hasWon;
              }
              widget.myGameBoard.setXO(index);
              var didWin = widget.myGameBoard.isWinner();
              print(widget.myGameBoard.getGrid());
              if (didWin) {
                hasWon = true;
                widget.winner = widget.myGameBoard.getWinner();
                print(widget.myGameBoard.getWinner());
              }
              // print(widget.myGameBoard.getGrid());
            });
          },
        );
      },
    );
  }
}
