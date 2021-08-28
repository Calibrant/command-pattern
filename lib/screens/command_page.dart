import 'package:change_shape_withcommand_pattern/domains/change_color_command.dart';
import 'package:change_shape_withcommand_pattern/domains/change_height_command.dart';
import 'package:change_shape_withcommand_pattern/domains/change_width_command.dart';
import 'package:change_shape_withcommand_pattern/domains/command.dart';
import 'package:change_shape_withcommand_pattern/models/shape.dart';
import 'package:change_shape_withcommand_pattern/screens/shape_container.dart';
import 'package:flutter/material.dart';

class CommandPage extends StatefulWidget {
  CommandPage({Key? key}) : super(key: key);

  @override
  _CommandPageState createState() => _CommandPageState();
}

class _CommandPageState extends State<CommandPage> {
  Shape _shape = Shape.initial();

  void changeColor() {
    final command = ChangeColorCommand(_shape);
    executeCommand(command);
  }

  void changeHeight() {
    final command = ChangeHeightCommand(_shape);
    executeCommand(command);
  }

  void changeWidth() {
    final command = ChangeWidthCommand(_shape);
    executeCommand(command);
  }

  void executeCommand(Command command) {
    setState(() {
      command.execute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Command Pattern'),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShapeContainer(shape: _shape),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Change color', 
                  style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                ),
                onPressed: changeColor,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Change height',
                  style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                ),
                onPressed: changeHeight,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Change width',
                  style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                ),
                onPressed: changeWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
