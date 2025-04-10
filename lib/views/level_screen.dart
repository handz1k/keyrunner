import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/start_screen.dart';
import '../widgets/game_button.dart';
import '../models/breakpoints.dart';
import '../services/levelService.dart';
import 'game_screen.dart';

class LevelScreen extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  @override
  Widget build(BuildContext context) {
    levelService.loadProgress();
    final levels = Iterable.generate(levelService.totalLevels).expand((level) {
      return [
        const Padding(padding: EdgeInsets.all(16)),
        GameButton(
            text:
                "Level ${level + 1} (${levelService.completedLevels.contains(level) ? "Completed" : "Not completed"})",
            onPressed: () {
              levelService.currentLevel = level + 1;
              Get.to(GameScreen());
            })
      ];
    }).toList();

    return GameScaffold(content: levels);
  }
}

class GameScaffold extends StatelessWidget {
  final List<Widget> content;
  const GameScaffold({required this.content});

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
                Column(
                  children: [
                    TextButton(
                      onPressed: () => Get.to(StartScreen()),
                      child: const Text(
                        "Main menu",
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 73, 72, 72),
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                    child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: content,
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
                Column(
                  children: [
                    TextButton(
                      onPressed: () => Get.to(StartScreen()),
                      child: const Text(
                        "Main menu",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 73, 72, 72),
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: content,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
