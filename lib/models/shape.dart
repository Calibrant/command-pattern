import 'dart:ui';
import 'package:flutter/material.dart';

class Shape{
  late Color color;
  late double height;
  late double width;

  Shape(this.color, this.height, this.width);

  Shape.initial(){
    color = Colors.black;
    height = 150;
    width = 150; 
  }
}