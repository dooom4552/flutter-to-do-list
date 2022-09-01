import 'dart:convert';

import 'package:to_do_list/services/todo_urls.dart';

import '../models/todo_item.dart';
import 'package:http/http.dart' as http;

class TodoProvider {
  Future<List<TodoItem>> getTodoItem() async {
    final response = await http.get(Uri.parse(TodoUrls.todos));
    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => TodoItem.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
