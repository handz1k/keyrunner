import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_runner/main.dart';
import 'package:key_runner/src/key_runner.dart';
import 'package:key_runner/views/level_screen.dart';
import 'package:key_runner/widgets/game_button.dart';

class LevelCompleteScreen extends StatelessWidget {
  final KeyRunner game;
  const LevelCompleteScreen({required this.game, super.key});

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
            "Well done, you passed the level!",
            style:
                TextStyle(fontSize: 64, color: Color.fromARGB(255, 73, 72, 72)),
          ),
          const Padding(padding: EdgeInsets.all(16)),
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
                text: "Next level",
                onPressed: () {
                  game.nextLevel();
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
