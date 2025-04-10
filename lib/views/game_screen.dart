import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../src/key_runner.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: KeyRunner(),
    );
  }
}
