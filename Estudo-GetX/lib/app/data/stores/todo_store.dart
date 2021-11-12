import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:novo_teste/app/data/models/todo_model.dart';
import 'package:novo_teste/app/data/providers/hive_service.dart';

class TodoStoreService extends GetxController {
  final HiveService hiveService;
  final TODO = 'todo';
  late Box box;

  TodoStoreService(this.hiveService);

  _startHive() async {
    box = await Hive.openBox(TODO);
  }

  Future<void> saveTodo(TodoModel todo) async {
    List<TodoModel> todos = await getTodos();
    List<dynamic> data = [];
    todos.add(todo);
    for (TodoModel todo in todos) {
      data.add(todo.toJson());
    }
    hiveService.saveData(TODO, data);
  }

  Future<List<TodoModel>> getTodos() async {
    List<TodoModel> result = [];
    dynamic response = await hiveService.getData(TODO);
    if (response != null) {
      for (Map item in response) {
        result.add(TodoModel(text: item['text'], done: item['done']));
      }
    }
    return result;
  }

  Future<void> removeTodo(TodoModel todo) async {
    List<TodoModel> todos = await getTodos();
    List<dynamic> data = [];
    todos.removeWhere((element) => element.text == todo.text);
    for (TodoModel todo in todos) {
      data.add(todo.toJson());
    }
    hiveService.saveData(TODO, data);
  }

  Future<void> removeTodoList(List<TodoModel> todosDelete) async {
    List<TodoModel> todos = await getTodos();
    List<dynamic> data = [];

    todosDelete.forEach((todoDelete) {
      todos.removeWhere((e) => e.text == todoDelete.text);
    });

    for (TodoModel todo in todos) {
      data.add(todo.toJson());
    }
    hiveService.saveData(TODO, data);
  }

  Future<void> editTodoList(List<TodoModel> todosUpdate) async {
    List<TodoModel> todos = await getTodos();
    List<dynamic> data = [];

    todosUpdate.forEach((todoUpdate) {
      int index = todos.indexWhere((e) => e.text == todoUpdate.text);
      todos[index].done = todoUpdate.done;
    });

    for (TodoModel todo in todos) {
      data.add(todo.toJson());
    }
    hiveService.saveData(TODO, data);
  }
}
