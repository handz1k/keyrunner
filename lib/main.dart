import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../views/start_screen.dart';
import '../services/levelService.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("levels");
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
