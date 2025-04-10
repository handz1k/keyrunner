import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../src/key_runner.dart';
import '../views/level_screen.dart';
import '../widgets/game_button.dart';
import '../models/breakpoints.dart';
import 'game_screen.dart';

class GameOverScreen extends StatelessWidget {
  final KeyRunner game;
  const GameOverScreen({required this.game, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > Breakpoints.xl) {
            return Stack(
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
                        "Oops, you fell off the map.",
                        style: TextStyle(
                            fontSize: 64,
                            color: Color.fromARGB(255, 73, 72, 72)),
                      ),
                      const Padding(padding: EdgeInsets.all(16)),
                      const Text(
                        "Would you like to try again?",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 73, 72, 72)),
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
                            },
                          ),
                          const Padding(padding: EdgeInsets.all(16)),
                          GameButton(
                            text: "Retry",
                            onPressed: () {
                              game.reset();
                              Get.offAll(() => GameScreen());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            );
          } else {
            return Stack(
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
                        "Oops, you fell off the map.",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 73, 72, 72)),
                      ),
                      const Padding(padding: EdgeInsets.all(16)),
                      const Text(
                        "Would you like to try again?",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 73, 72, 72)),
                      ),
                      const Padding(padding: EdgeInsets.all(16)),
                      Column(
                        children: [
                          GameButton(
                            text: "Levels",
                            onPressed: () {
                              game.reset();
                              Get.to(LevelScreen());
                            },
                          ),
                          const Padding(padding: EdgeInsets.all(16)),
                          GameButton(
                            text: "Retry",
                            onPressed: () {
                              game.reset();
                              Get.offAll(() => GameScreen());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            );
          }
        },
      ),
    );
  }
}
