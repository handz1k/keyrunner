import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  // ignore: use_key_in_widget_constructors
  const GameButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
