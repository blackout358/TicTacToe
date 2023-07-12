import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/app_button.dart';

class ButtonGrid extends StatefulWidget {
  final ValueChanged<String> onPressed;
  String turn;
  List<String> displayXO;
  ButtonGrid({
    super.key,
    required this.turn,
    required this.onPressed,
    required this.displayXO,
  });

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

// List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

class _ButtonGridState extends State<ButtonGrid> {
  void setXO(int index) {
    setState(() {
      if (widget.displayXO[index].isEmpty && widget.turn == "X") {
        widget.displayXO[index] = widget.turn;
        widget.turn = "O";
      } else if (widget.displayXO[index].isEmpty && widget.turn == "O") {
        widget.displayXO[index] = widget.turn;
        widget.turn = "X";
      } else {
        widget.displayXO[index] = ":(";
      }
    });
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
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          text: widget.displayXO[index],
          width: 10,
          height: 10,
          borderRadius: 20,
          onPressed: () {
            print(index);
            setXO(index);
            widget.onPressed(widget.displayXO[index]);
          },
        );
      },
    );
  }
}
