import 'package:flutter/material.dart';

import '../widgets/gridview_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: ButtonGrid(),
            )
          ],
        ),
      ),
    );
  }
}
