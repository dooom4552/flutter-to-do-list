import '../models/todo_item.dart';

abstract class TodoEvent {}

class TodoLoadEvent extends TodoEvent {}

class TodoDeleteEvent extends TodoEvent {
  TodoItem todoItem;
  TodoDeleteEvent({
    required this.todoItem,
  });
}

class TodoAddEvent extends TodoEvent {
  final String title;
  TodoAddEvent({required this.title});
}
