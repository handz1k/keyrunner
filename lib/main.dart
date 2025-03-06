import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_runner/src/key_runner.dart';
import 'package:key_runner/widgets/game_button.dart';
import 'package:key_runner/views/level_screen.dart';

void main() {
  Get.put(LevelService());
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                  "Keyrunner",
                  style: TextStyle(
                      fontSize: 64, color: Color.fromARGB(255, 73, 72, 72)),
                ),
                const Padding(padding: EdgeInsets.all(16)),
                GameButton(
                  text: "Start",
                  onPressed: () => Get.to(() => LevelScreen()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: KeyRunner(),
    );
  }
}
