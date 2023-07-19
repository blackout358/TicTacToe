import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF757575),
      leading: const Icon(Icons.gamepad_rounded),
      title: const Text("Tic Tac Toe"),
      centerTitle: true,
    );
  }
}
