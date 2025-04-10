import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/game_button.dart';
import '../views/level_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
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
          )),
        ],
      ),
    );
  }
}
