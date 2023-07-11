import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/app_button.dart';

import '../widgets/gridview_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String turn = "O";
  void setTurn(String turn) {
    turn == "O"
        ? setState(
            () {
              turn = "X";
            },
          )
        : setState(
            () {
              turn = "O";
            },
          );
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
              onPressed: (String value) {},
            ),
          ),
          Text(
            turn,
            style: TextStyle(
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}
