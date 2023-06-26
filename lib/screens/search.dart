import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/widgets/lista_noticias.dart';

class SearchScreen extends StatelessWidget {
  final SearchbarController searchbarController;

  const SearchScreen({super.key, required this.searchbarController});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: ListaNoticias(noticias: searchbarController.resultados),
      );
    });
  }
}
