import 'package:to_do_list/models/todo_item.dart';

abstract class TodoState {}

class TodoEmptyState extends TodoState {}

class TodoLoadedState extends TodoState {
  List<TodoItem> todoItems;
  TodoLoadedState({required this.todoItems});
}

class TodoErrorState extends TodoState {}
