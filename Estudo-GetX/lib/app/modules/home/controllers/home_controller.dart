import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novo_teste/app/data/models/todo_model.dart';
import 'package:novo_teste/app/modules/home/models/todo_listview_controller.dart';

class HomeController extends GetxController {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  RxList<TodoListViewController> todos = RxList<TodoListViewController>();

  final _text = ''.obs;
  get text => _text.value;
  void setText(value) => _text.value = value;

  void saveText() {
    formKey.currentState!.save();
    todos.add(
      TodoListViewController(todo: TodoModel(text: text)),
    );
    formKey.currentState!.reset();
  }
}
