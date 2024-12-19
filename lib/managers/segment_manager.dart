import 'package:flame/components.dart';
import 'package:key_runner/objects/platform_block.dart';
import '../objects/star.dart';
import '../objects/ground_block.dart';
import '../objects/platform_block.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  final double level = 1;
  Block(this.gridPosition, this.blockType);
}

final segments = [
  segment0,
  segment1,
  segment2,
  segment3,
  segment4,
];

final segment0 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 1), GroundBlock),
  Block(Vector2(3, 3), GroundBlock),
  Block(Vector2(4, 3), GroundBlock),
  Block(Vector2(3, 5), PlatformBlock),
  Block(Vector2(8, 9), PlatformBlock),
];

final segment1 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(
      Vector2(1, 0), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(4, 3), PlatformBlock),

  Block(
      Vector2(5, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
];

final segment2 = [
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
  Block(Vector2(9, 1), Star),
];

final segment3 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 1), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(2, 0), GroundBlock),

  Block(Vector2(7, 0), GroundBlock),
  Block(
      Vector2(7, 1), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 8), GroundBlock), // Changed from Star to GroundBlock
  Block(Vector2(9, 0), GroundBlock),
];

final segment4 = [
  Block(Vector2(0, 0), GroundBlock),
];
