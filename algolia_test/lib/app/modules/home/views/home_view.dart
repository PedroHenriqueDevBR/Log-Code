import 'package:angolia_test/app/modules/controllers/home_controller.dart';
import 'package:angolia_test/app/modules/home/components/product_item_widget.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController controller;
  
  @override
  void initState() {
    controller = HomeController(homeState: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.txtSearch,
                        decoration: InputDecoration(
                          labelText: 'Pesquisa',
                          hintText: 'Ex: Galaxy',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: controller.search,
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: controller.products.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) => ListItem(
                    product: controller.products[index],
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: controller.currentPage > 0 ? controller.previousPage : null,
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Column(
                    children: [
                      Text('${controller.totalResults} resultados'),
                      Text('página ${controller.currentPage + 1} de ${controller.availablePages+1}'),
                    ],
                  ),
                  IconButton(
                    onPressed: controller.currentPage < controller.availablePages - 1 ? controller.nextPage : null,
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
