import 'package:get/get_instance/get_instance.dart';
import 'package:get/instance_manager.dart';
import 'package:novo_teste/app/data/providers/hive_service.dart';
import 'package:novo_teste/app/data/stores/todo_store.dart';
import 'package:novo_teste/app/modules/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        todoStoreService: TodoStoreService(
          HiveService(),
        ),
      ),
    );
  }
}
