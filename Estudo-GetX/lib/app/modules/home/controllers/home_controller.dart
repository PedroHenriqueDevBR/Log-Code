import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novo_teste/app/data/models/todo_model.dart';
import 'package:novo_teste/app/data/stores/todo_store.dart';
import 'package:novo_teste/app/modules/home/models/todo_listview_controller.dart';

class HomeController extends GetxController {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  RxList<TodoListViewController> todos = RxList<TodoListViewController>();

  final _text = ''.obs;
  get text => _text.value;
  void setText(value) => _text.value = value;
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
    TodoModel todo = TodoModel(text: text);
    todos.add(TodoListViewController(todo: todo));
    todoStoreService.saveTodo(todo);
    formKey.currentState!.reset();
  }

  void removeSelectedToDos() async {
    final selecteds = todos.where((element) => element.selected.value == true);
    for (TodoListViewController selected in selecteds) {
      await todoStoreService.removeTodo(selected.todo).then((_) => loadTodos());
    }
  }
}
