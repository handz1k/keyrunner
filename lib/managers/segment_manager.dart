import 'package:flame/components.dart';

import '../objects/ground_block.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
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
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 1), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(5, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(9, 0), GroundBlock),
];

final segment1 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 1), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(1, 2), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(1, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(2, 6), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(3, 6), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(7, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(7, 7), GroundBlock), // Changed from Star to GroundBlock
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 1), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(8, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(8, 6), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(9, 0), GroundBlock),
];

final segment2 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(3, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(4, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(5, 4), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 4), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 7), GroundBlock), // Changed from Star to GroundBlock
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment3 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(1, 1), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(2, 1), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(2, 2), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(4, 4), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 6), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(7, 1), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 8), GroundBlock), // Changed from Star to GroundBlock
  Block(Vector2(9, 0), GroundBlock),
];

final segment4 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(2, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(3, 1), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(3, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(5, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(6, 5), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(6, 7), GroundBlock), // Changed from Star to GroundBlock
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(8, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
  Block(Vector2(9, 0), GroundBlock),
  Block(Vector2(9, 1), GroundBlock), // Changed from WaterEnemy to GroundBlock
  Block(Vector2(9, 3), GroundBlock), // Changed from PlatformBlock to GroundBlock
];
