import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novo_teste/app/modules/home/models/todo_listview_controller.dart';

class ItemListWidget extends StatelessWidget {
  TodoListViewController todoController;

  ItemListWidget({
    Key? key,
    required this.todoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: todoController.selected.value,
              onChanged: (value) => todoController.selected.value = value!,
            ),
            Expanded(child: Text(todoController.todo.text)),
          ],
        ),
      ),
    );
  }
}
