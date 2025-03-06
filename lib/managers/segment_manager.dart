import 'package:flame/components.dart';
import 'package:key_runner/objects/platform_block.dart';
import '../objects/key.dart';
import '../objects/ground_block.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final Map<int, List<List<Block>>> levelSegments = {
  1: [segment0, segment1],
  2: [segment2, segment3],
  3: [segment4, segment5, segment6],
};

final segment0 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(4, 2), PlatformBlock),
  Block(Vector2(7, 3), GroundBlock),
  Block(Vector2(8, 3), GroundBlock),
  Block(Vector2(9, 5), GoldKey),
];

final segment1 = [
  Block(Vector2(0, 4), GroundBlock),
  Block(Vector2(1, 4), GroundBlock),
  Block(Vector2(2, 4), GroundBlock),
  Block(Vector2(3, 6), PlatformBlock),
  Block(Vector2(6, 6), GroundBlock),
  Block(Vector2(7, 2), GroundBlock),
  Block(Vector2(8, 1), GroundBlock),
  Block(Vector2(9, 2), GoldKey),
];

final segment2 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(4, 0), PlatformBlock),
  Block(Vector2(5, 1), PlatformBlock),
  Block(Vector2(6, 3), GoldKey),
  Block(Vector2(7, 1), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
];

final segment3 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 1), PlatformBlock),
  Block(Vector2(3, 2), PlatformBlock),
  Block(Vector2(4, 3), GoldKey),
  Block(Vector2(5, 4), PlatformBlock),
  Block(Vector2(6, 5), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment4 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 1), GoldKey),
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
  Block(Vector2(6, 2), GoldKey),
  Block(Vector2(7, 1), PlatformBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];

final segment6 = [
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 1), PlatformBlock),
  Block(Vector2(2, 2), PlatformBlock),
  Block(Vector2(3, 3), GoldKey),
  Block(Vector2(4, 2), PlatformBlock),
  Block(Vector2(5, 1), PlatformBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(7, 0), GroundBlock),
  Block(Vector2(8, 0), GroundBlock),
  Block(Vector2(9, 0), GroundBlock),
];
