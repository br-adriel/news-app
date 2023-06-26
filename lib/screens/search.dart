import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:news_app/widgets/loading_circular.dart';

class SearchScreen extends StatelessWidget {
  final SearchbarController searchbarController;

  const SearchScreen({super.key, required this.searchbarController});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (searchbarController.estaCarregandoPrimeiraVez) {
        return const LoadingCircular();
      }
      return Scaffold(
        body: ListaNoticias(noticias: searchbarController.resultados),
      );
    });
  }
}
