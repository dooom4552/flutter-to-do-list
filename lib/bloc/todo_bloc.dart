import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/todo_event.dart';
import 'package:to_do_list/bloc/todo_state.dart';
import 'package:to_do_list/models/todo_item.dart';
import 'package:to_do_list/services/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  List<TodoItem> loadedTodoList = [];
  TodoBloc({required this.todoRepository}) : super(TodoEmptyState()) {
    on<TodoLoadEvent>(_onClickLoadEvent);
    on<TodoDeleteEvent>(_onClickDeleteEvent);
    on<TodoAddEvent>(_onClickAddEvent);
  }

  _onClickLoadEvent(TodoLoadEvent event, Emitter<TodoState> emit) async {
    try {
      loadedTodoList = await todoRepository.getTodoItems();
      emit(TodoLoadedState(todoItems: loadedTodoList));
    } catch (_) {
      emit(TodoErrorState());
    }
  }

  FutureOr<void> _onClickDeleteEvent(
      TodoDeleteEvent event, Emitter<TodoState> emit) {
    try {
      loadedTodoList.remove(event.todoItem);
      emit(TodoLoadedState(todoItems: loadedTodoList));
    } catch (_) {
      emit(TodoErrorState());
    }
  }

  _onClickAddEvent(TodoAddEvent event, Emitter<TodoState> emit) {
    final TodoItem todoItem = TodoItem(
        completed: false,
        id: Random().nextInt(1000),
        title: event.title,
        userId: Random().nextInt(1000));
    loadedTodoList.add(todoItem);
    emit(TodoLoadedState(todoItems: loadedTodoList));
  }
}
