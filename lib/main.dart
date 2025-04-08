import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_runner/views/start_screen.dart';
import 'package:key_runner/services/levelService.dart';

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
