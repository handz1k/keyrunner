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
  segment5,
  segment6,
];

final segment0 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(4, 2), PlatformBlock),
  Block(Vector2(7, 3), GroundBlock),
  Block(Vector2(8, 3), GroundBlock),
  Block(Vector2(9, 5), Star),
];

final segment1 = [
  Block(Vector2(0, 4), GroundBlock),
  Block(Vector2(1, 4), GroundBlock),
  Block(Vector2(2, 4), GroundBlock),
  Block(Vector2(3, 6), PlatformBlock),
  Block(Vector2(6, 6), GroundBlock),
  Block(Vector2(7, 2), GroundBlock),
  Block(Vector2(8, 1), GroundBlock),
  Block(Vector2(9, 2), Star),
];

final segment2 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(4, 0), PlatformBlock),
  Block(Vector2(5, 1), PlatformBlock),
  Block(Vector2(6, 3), Star),
  Block(Vector2(7, 1), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
];

final segment3 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 1), PlatformBlock),
  Block(Vector2(3, 2), PlatformBlock),
  Block(Vector2(4, 3), Star),
  Block(Vector2(5, 4), PlatformBlock),
  Block(Vector2(6, 5), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment4 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 1), Star),
  Block(Vector2(3, 1), PlatformBlock),
  Block(Vector2(4, 2), PlatformBlock),
  Block(Vector2(5, 3), GroundBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
];

final segment5 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(4, 1), PlatformBlock),
  Block(Vector2(5, 2), PlatformBlock),
  Block(Vector2(6, 2), Star),
  Block(Vector2(7, 1), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment6 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 1), PlatformBlock),
  Block(Vector2(2, 2), PlatformBlock),
  Block(Vector2(3, 3), Star),
  Block(Vector2(4, 2), PlatformBlock),
  Block(Vector2(5, 1), PlatformBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];
