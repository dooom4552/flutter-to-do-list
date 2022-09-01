import 'package:to_do_list/models/todo_item.dart';
import 'package:to_do_list/services/todo_api_provider.dart';

class TodoRepository {
  final TodoProvider _todoProvider = TodoProvider();
  Future<List<TodoItem>> getTodoItems() => _todoProvider.getTodoItem();
}
