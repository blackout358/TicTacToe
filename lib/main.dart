import 'package:flutter/material.dart';
import 'package:tictactoe/screens/main_screen.dart';
import 'package:tictactoe/widgets/appbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: MainScreen(),
      ),
    );
  }
}
