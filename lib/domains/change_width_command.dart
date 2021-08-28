import 'dart:math';

import 'package:change_shape_withcommand_pattern/domains/command.dart';
import 'package:change_shape_withcommand_pattern/models/shape.dart';

class ChangeWidthCommand implements Command {
 Shape shape;
  late double previousWidth;

  ChangeWidthCommand(this.shape) {
    previousWidth = shape.width;
  }

  @override
  void execute() {
    var random = Random();
    shape.width = 50 + random.nextInt(150 - 50).toDouble();
  }

  String getTitle(){
    return 'Change width';
  }

  @override
  void undo() {
    shape.width = previousWidth;
  }
}
