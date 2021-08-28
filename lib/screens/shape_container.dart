import 'package:change_shape_withcommand_pattern/models/shape.dart';
import 'package:flutter/material.dart';

class ShapeContainer extends StatelessWidget {
  const ShapeContainer({Key? key, required this.shape}) : super(key: key);
  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(microseconds: 500),
         height: shape.height,
          width: shape.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: shape.color),
          child: Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
