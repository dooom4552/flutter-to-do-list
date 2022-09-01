import 'dart:math';
import '../models/todo_item.dart';

abstract class TodoEvent {}

class TodoLoadEvent extends TodoEvent {}

class TodoDeleteEvent extends TodoEvent {
  int id;
  TodoDeleteEvent({
    required this.id,
  });
}

class TodoAddEvent extends TodoEvent {
  final String title;
  TodoAddEvent({required this.title});

  // factory TodoAddEvent.getFakeTask({required String title}) {
  //   return TodoAddEvent(
  //       todoItem: TodoItem(
  //           completed: false,
  //           title: title,
  //           id: Random().nextInt(100),
  //           userId: Random().nextInt(100)));
  // }
}
