import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/services/todo_repository.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/actions_tab.dart';
import '../widgets/task_list.dart';

class HomePage extends StatelessWidget {
  final TodoRepository todoRepository = TodoRepository();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(todoRepository: todoRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.5),
        ),
        body:
            Column(children: [ActionsTab(), const Expanded(child: TaskList())]),
      ),
    );
  }
}
