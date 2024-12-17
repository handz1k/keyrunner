import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:key_runner/src/key_runner.dart';


void main() {
  runApp(
    const GameWidget<KeyRunner>.controlled(
      gameFactory: KeyRunner.new,
    ),
  );
}