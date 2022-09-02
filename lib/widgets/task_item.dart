import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/todo_item.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.index,
    required this.todoItem,
  }) : super(key: key);
  final int index;
  final TodoItem todoItem;
  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return Container(
      color: index % 2 == 0 ? Colors.blue.withOpacity(0.5) : Colors.blue[100],
      padding: const EdgeInsets.all(16.0),
      child: Row(children: [
        SizedBox(
          width: 50,
          child: Text('$index'),
        ),
        Expanded(
          child: Text(todoItem.title),
        ),
        OutlinedButton(
          // ignore: avoid_print
          onPressed: () {
            todoBloc.add(TodoDeleteEvent(todoItem: todoItem));
          },
          child: const Text('Delete'),
        )
      ]),
    );
  }
}
