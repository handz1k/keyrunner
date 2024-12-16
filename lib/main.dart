import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'src/key_runner.dart'; // Add this import

void main() {
  final game = KeyRunner(); // Modify this line
  runApp(GameWidget(game: game));
}
