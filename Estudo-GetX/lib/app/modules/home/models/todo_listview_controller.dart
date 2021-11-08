import 'package:get/state_manager.dart';
import 'package:novo_teste/app/data/models/todo_model.dart';

class TodoListViewController extends GetxController {
  TodoModel todo;
  final selected = false.obs;
  TodoListViewController({required this.todo});
}
