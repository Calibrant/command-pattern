import 'package:change_shape_withcommand_pattern/domains/change_color_command.dart';
import 'package:change_shape_withcommand_pattern/domains/change_height_command.dart';
import 'package:change_shape_withcommand_pattern/domains/change_width_command.dart';
import 'package:change_shape_withcommand_pattern/domains/command.dart';
import 'package:change_shape_withcommand_pattern/domains/command_history.dart';
import 'package:change_shape_withcommand_pattern/models/shape.dart';
import 'package:change_shape_withcommand_pattern/screens/command_history_column.dart';
import 'package:change_shape_withcommand_pattern/screens/shape_container.dart';
import 'package:flutter/material.dart';

class CommandPage extends StatefulWidget {
  CommandPage({Key? key}) : super(key: key);

  @override
  _CommandPageState createState() => _CommandPageState();
}

class _CommandPageState extends State<CommandPage> {
  final Shape _shape = Shape.initial();
  final CommandHistory _commandHistory = CommandHistory();

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
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
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
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ShapeContainer(shape: _shape),
              const SizedBox(
                height: 8.0,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Change color',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: changeColor,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Change height',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: changeHeight,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Change width',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: changeWidth,
              ),
              const Divider(),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  'Undo',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: _commandHistory.isEmpty ? null : _undo,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  CommandHistoryColumn(
                    commandList: _commandHistory.commandHistoryList,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
