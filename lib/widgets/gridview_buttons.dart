import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/app_button.dart';

class ButtonGrid extends StatefulWidget {
  final ValueChanged<String> onPressed;
  String turn;
  ButtonGrid({
    super.key,
    required this.turn,
    required this.onPressed,
  });

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

class _ButtonGridState extends State<ButtonGrid> {
  void setXO(int index) {
    setState(() {
      if (displayXO[index].isEmpty && widget.turn == "X") {
        displayXO[index] = widget.turn;
        widget.turn = "O";
      } else if (displayXO[index].isEmpty && widget.turn == "O") {
        displayXO[index] = widget.turn;
        widget.turn = "X";
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
          text: displayXO[index],
          width: 10,
          height: 10,
          borderRadius: 20,
          onPressed: () {
            print(index);
            setXO(index);
            widget.onPressed(displayXO[index]);
          },
        );
      },
    );
  }
}
