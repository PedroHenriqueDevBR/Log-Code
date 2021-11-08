import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:novo_teste/app/modules/home/components/item_list_widget.dart';
import 'package:novo_teste/app/modules/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
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
      body: Obx(() {
        return Column(
          children: [
            form(),
            Expanded(
              child: Column(
                children: [
                  ...controller.todos
                      .map(
                        (e) => ItemListWidget(todoController: e),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        );
      }),
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
                    controller.saveText();
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
}
