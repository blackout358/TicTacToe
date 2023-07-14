import 'package:flutter/material.dart';
import 'package:tictactoe/logic/win_checker.dart';
import 'package:tictactoe/widgets/app_button.dart';

class ButtonGrid extends StatefulWidget {
  final ValueChanged<String> onPressed;
  String turn;
  String winner;
  List<String> displayXO;
  ButtonGrid({
    super.key,
    required this.turn,
    required this.onPressed,
    required this.displayXO,
    required this.winner,
  });

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

// List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

class _ButtonGridState extends State<ButtonGrid> {
  void clearWinner() {
    setState(() {
      if (widget.winner.isNotEmpty) {
        widget.displayXO = ['', '', '', '', '', '', '', '', ''];
      }
    });
  }

  void setXO(int index) {
    if (widget.displayXO[index].isEmpty && widget.turn == "X") {
      widget.displayXO[index] = widget.turn;
      widget.turn = "O";
    } else if (widget.displayXO[index].isEmpty && widget.turn == "O") {
      widget.displayXO[index] = widget.turn;
      widget.turn = "X";
    }
    ;
    setState(() {});

    // });
  }

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
          text: widget.displayXO[index],
          width: 10,
          height: 10,
          borderRadius: 35,
          onPressed: () {
            // print(index);

            setState(() {
              setXO(index);
            });
            checkWinner();
            clearWinner();
            // checkWinner();
            widget.onPressed(widget.displayXO[index]);
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
