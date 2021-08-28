import 'dart:math';

import 'package:change_shape_withcommand_pattern/domains/command.dart';
import 'package:change_shape_withcommand_pattern/models/shape.dart';

class ChangeHeightCommand implements Command {
 Shape shape;
  late double previousHeight;
  ChangeHeightCommand(this.shape) {
    previousHeight = shape.height;
  }

  @override
  void execute() {
    Random random = Random();
    shape.height = 50 + random.nextInt(150 - 50).toDouble();
  }

  @override
  void undo() {
    shape.height = previousHeight;
  }
}
