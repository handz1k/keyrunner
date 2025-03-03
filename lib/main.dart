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
          // Background image
          Positioned.fill(
            child: Image.asset(
              "../assets/images/background.png", // Change to your actual image path
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Keyrunner",
                  style: TextStyle(
                      fontSize: 64,
                      color: Color.fromARGB(
                          255, 73, 72, 72)), // White text for contrast
                ),
                const Padding(padding: EdgeInsets.all(16)),
                GameButton(
                  text: "Start",
                  onPressed: () => Get.to(() => GameScreen()),
                ),
                GameButton(
                  text: "Choose level",
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
