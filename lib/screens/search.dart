import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:news_app/widgets/loading_circular.dart';
import 'package:news_app/widgets/search_screen_layout/no_articles_found.dart';
import 'package:news_app/widgets/search_screen_layout/no_search_text.dart';

class SearchScreen extends StatelessWidget {
  final SearchbarController searchbarController;

  const SearchScreen({super.key, required this.searchbarController});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (searchbarController.estaCarregandoPrimeiraVez) {
        return const LoadingCircular();
      } else if (searchbarController.pesquisa.isEmpty) {
        return const NoSearchText();
      } else if (searchbarController.resultados.isEmpty) {
        return const NoArticlesFound();
      }
      return Scaffold(
        body: ListaNoticias(
          noticias: searchbarController.resultados,
          atingirFim: () async {},
          atualizar: () async {},
        ),
      );
    });
  }
}
