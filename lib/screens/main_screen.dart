import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/app_button.dart';
import 'package:tictactoe/logic/win_checker.dart';
import '../widgets/gridview_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String turn = "X";
  String winner = "";
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  void setTurn(String value) {
    value == "O"
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
              onPressed: (String value) {
                setTurn(value);
                setState(() {
                  winner = WinnerChecker.checkWinner(displayXO);
                });
              },
              displayXO: displayXO,
            ),
          ),
          Row(
            children: [
              AppButtons(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                text: "X",
                width: 90,
                height: 90,
                borderRadius: 15,
                onPressed: () {
                  setState(() {
                    turn = "X";
                  });
                },
              ),
              AppButtons(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                text: turn,
                width: 90,
                height: 90,
                borderRadius: 15,
                onPressed: () {
                  setState(() {
                    displayXO = ['', '', '', '', '', '', '', '', ''];
                  });
                },
              ),
              AppButtons(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                text: "O",
                width: 90,
                height: 90,
                borderRadius: 15,
                onPressed: () {
                  setState(() {
                    turn = "O";
                  });
                },
              ),
            ],
          ),
          Text(
            winner,
            style: TextStyle(
              fontSize: 50,
              color: Colors.blue[400],
            ),
          ),
        ],
      ),
    );
  }
}
