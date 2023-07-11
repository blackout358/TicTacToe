import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/app_button.dart';

class ButtonGrid extends StatefulWidget {
  const ButtonGrid({super.key});

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
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
          text: "T",
          width: 10,
          height: 10,
          borderRadius: 20,
          onPressed: () {
            print(index);
          },
        );
      },
    );
  }
}
