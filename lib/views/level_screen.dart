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
            text: "${level + 1}",
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
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "../assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Center(
            child: Column(
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
