import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_runner/main.dart';
import 'package:key_runner/src/key_runner.dart';
import 'package:key_runner/views/level_screen.dart';
import 'package:key_runner/widgets/game_button.dart';

class GameOverScreen extends StatelessWidget {
  final KeyRunner game;
  const GameOverScreen({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          "../assets/images/background.png",
          fit: BoxFit.cover,
        ),
      ),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Oops, you fell off the map.",
            style:
                TextStyle(fontSize: 64, color: Color.fromARGB(255, 73, 72, 72)),
          ),
          const Padding(padding: EdgeInsets.all(16)),
          const Text(
            "Would you like to try again?",
            style:
                TextStyle(fontSize: 32, color: Color.fromARGB(255, 73, 72, 72)),
          ),
          const Padding(padding: EdgeInsets.all(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GameButton(
                  text: "Levels",
                  onPressed: () {
                    game.reset();
                    Get.to(LevelScreen());
                  }),
              const Padding(padding: EdgeInsets.all(16)),
              GameButton(
                text: "Retry",
                onPressed: () {
                  game.reset();
                  Get.offAll(() => GameScreen());
                },
              )
            ],
          )
        ],
      )),
    ]));
  }
}
