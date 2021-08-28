import 'dart:math';

import 'package:change_shape_withcommand_pattern/domains/command.dart';
import 'package:change_shape_withcommand_pattern/models/shape.dart';
import 'package:flutter/material.dart';

class ChangeColorCommand implements Command {
  late Shape shape;
  late Color previousColor = shape.color;

  ChangeColorCommand(this.shape) {
    previousColor = shape.color;
  }

  @override
  void execute() {
    Random random = Random();
    shape.color = Color.fromRGBO(
        random.nextInt(250), random.nextInt(250), random.nextInt(250), 1.0);
  }

  @override
  void undo() {
    shape.color = previousColor;
  }

  @override
  String getTitle() {
    return 'Change color';
  }
}
