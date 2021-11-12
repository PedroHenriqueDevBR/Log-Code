import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novo_teste/app/data/models/todo_model.dart';
import 'package:novo_teste/app/data/stores/todo_store.dart';
import 'package:novo_teste/app/modules/home/models/todo_listview_controller.dart';

class HomeController extends GetxController {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  RxList<TodoListViewController> todos = RxList<TodoListViewController>();

  TextEditingController txtText = TextEditingController(text: '');
  TodoStoreService todoStoreService;

  HomeController({
    required this.todoStoreService,
  }) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    List<TodoModel> todoResponse = await todoStoreService.getTodos();
    todos.clear();
    for (TodoModel todo in todoResponse) {
      TodoListViewController todoController = TodoListViewController(todo: todo);
      todos.add(todoController);
    }
  }

  void saveText() {
    formKey.currentState!.save();
    final text = txtText.text;
    TodoModel todo = TodoModel(text: text);
    todos.add(TodoListViewController(todo: todo));
    todoStoreService.saveTodo(todo);
    formKey.currentState!.reset();
  }

  void removeSelectedToDos() async {
    final selecteds = todos.where((element) => element.selected.value == true).toList();
    await todoStoreService.removeTodoList(selecteds.map((e) => e.todo).toList()).then((_) => loadTodos());
  }

  void editSelectedToDos() async {
    final selecteds = todos.where((element) => element.selected.value == true).toList();
    for (TodoListViewController todoController in selecteds) {
      todoController.todo.done = !todoController.todo.done;
    }
    await todoStoreService.editTodoList(selecteds.map((e) => e.todo).toList());
    loadTodos();
  }
}
