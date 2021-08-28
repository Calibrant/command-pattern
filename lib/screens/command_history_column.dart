import 'package:flutter/material.dart';

class CommandHistoryColumn extends StatelessWidget {
  const CommandHistoryColumn({required this.commandList});
  final List<String> commandList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Command history:', style: Theme.of(context).textTheme.headline6),
        SizedBox(
          height: 4,
        ),
        if (commandList.isEmpty) const Text('Command history is empty'),
        for (var i = 0; i < commandList.length; i++)
          Text(
            '${i + 1} ${commandList[i]}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
      ],
    );
  }
}
