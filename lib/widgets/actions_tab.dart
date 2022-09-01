import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/todo_bloc.dart';

import '../bloc/todo_event.dart';

class ActionsTab extends StatelessWidget {
  ActionsTab({Key? key}) : super(key: key);
  final myContrroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return Row(
      children: [
        const SizedBox(
          width: 8.0,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: myContrroller,
            decoration: const InputDecoration(
              labelText: 'Task',
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            todoBloc.add(TodoAddEvent(title: myContrroller.text));
            myContrroller.clear();
          },
          child: const Text('Add'),
        ),
        const SizedBox(
          width: 8.0,
        ),
        OutlinedButton(
          onPressed: () {
            todoBloc.add(TodoLoadEvent());
          },
          child: const Text('load'),
        ),
      ],
    );
  }
}
