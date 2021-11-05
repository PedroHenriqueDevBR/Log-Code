import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:novo_teste/app/modules/home/controllers/home_controller.dart';
import 'package:novo_teste/app/modules/home/models/todo_listview_controller.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Column(
        children: [
          form(),
          Expanded(
            child: todoList(),
          ),
        ],
      ),
    );
  }

  Widget form() {
    HomeController controller = Get.put(HomeController());
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('No que você está pensando?'),
                hintText: 'Digite algo',
              ),
              autocorrect: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) {
                controller.setText(newValue);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite algo para salvar';
                }
              },
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    controller.saveText();
                    controller.formKey.currentState!.reset();
                  }
                },
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget todoList() {
    HomeController controller = Get.put(HomeController());
    return Obx(
      () => ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.todos.length,
        itemBuilder: (ctx, index) {
          TodoListViewController todoView = controller.todos[index];
          return ListTile(
            leading: Checkbox(
              value: todoView.selected,
              onChanged: (bool? value) {
                todoView.selected = !todoView.selected;
                // O Erro está aqui
                // Quando o checkbox é clicado o valor não é atualizado
                controller.refresh();
              },
            ),
            title: Text(
              todoView.todo.text,
              style: TextStyle(
                decoration: todoView.todo.done ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
