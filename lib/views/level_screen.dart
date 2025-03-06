import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_runner/main.dart';
import 'package:key_runner/widgets/game_button.dart';

class LevelService {
  final totalLevels = 3;
  final completedLevels = Set();
  var currentLevel = 0;
}

class LevelScreen extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  @override
  Widget build(BuildContext context) {
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
    return GameScaffold(content: [
      ...levels,
    ]);
  }
}

class GameScaffold extends StatelessWidget {
  final List<Widget> content;
  const GameScaffold({required this.content});

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: content,
            ),
          ),
        ],
      ),
    );
  }
}
