import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/todo_bloc.dart';
import 'package:to_do_list/bloc/todo_state.dart';

import 'task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoEmptyState) {
        return const Center(
          child: Text(
            'No data received Press button "load"',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      } else if (state is TodoLoadedState) {
        return ListView.builder(
          itemCount: state.todoItems.length,
          itemBuilder: (context, index) => TaskItem(
            index: index,
            todoItem: state.todoItems[index],
          ),
        );
      } else if (state is TodoErrorState) {
        return const Center(
          child: Text(
            'Error fetching users',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      } else {
        return const Center(
          child: Text(
            'Error',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
    });
  }
}
