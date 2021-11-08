import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novo_teste/app/data/models/todo_model.dart';
import 'package:novo_teste/app/data/providers/hive_service.dart';

class TodoStore extends GetxController {
  final HiveService hiveService;
  final TODO = 'todo';

  TodoStore(this.hiveService);

  Future<void> initHive() async {
    await hiveService.initHive();
  }

  Future<void> saveTodo(TodoModel todo) async {
    List<TodoModel> todos = await hiveService.getData(TODO) as List<TodoModel>;
    todos.add(todo);
    hiveService.saveData(TODO, todos);
  }

  Future<List<TodoModel>> getTodos() async => await hiveService.getData(TODO) as List<TodoModel>;

  Future<void> removeTodo(TodoModel todo) async {
    List<TodoModel> todos = await getTodos();
    todos.remove(todo);
    hiveService.updateData(TODO, todos);
  }
}
