import 'package:algolia/algolia.dart';
import 'package:angolia_test/app/shared/consts/algolia_key.dart';
import 'package:angolia_test/app/shared/models/ProductCommerce.dart';
import 'package:flutter/material.dart';

class HomeController {
  late Algolia algolia;
  late AlgoliaQuery query;

  final INDEX = 'first_test';
  final TextEditingController txtSearch = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  String lastSearch = '';
  int currentPage = 0;
  int availablePages = 0;
  int totalResults = 0;
  List<ProductCommerce> products = [];
  State homeState;

  HomeController({required this.homeState}) {
    algolia = AlgoliaKey.algolia;
    getData();
  }

  getData({searchKey = ''}) {
    query = algolia.instance.index(INDEX).query(searchKey).setPage(currentPage);
    applyQuery();
  }

  void applyQuery() async {
    AlgoliaQuerySnapshot querySnapshot = await query.getObjects();
    formatResult(querySnapshot);
  }

  void search() async {
    if (formKey.currentState!.validate()) {
      currentPage = lastSearch == txtSearch.text ? currentPage : 0;
      lastSearch = txtSearch.text;
      getData(searchKey: txtSearch.text);
    }
  }

  formatResult(AlgoliaQuerySnapshot snapshot) {
    List<AlgoliaObjectSnapshot> objects = snapshot.hits;
    homeState.setState(() {
      currentPage = snapshot.page;
      availablePages = snapshot.nbPages;
      totalResults = snapshot.nbHits;
      products = objects.map((e) => ProductCommerce.fromMap(e.data)).toList();
    });
  }

  void nextPage() {
    if (currentPage < availablePages) {
      currentPage++;
      search();
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
      search();
    }
  }
}