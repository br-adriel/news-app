import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/screens/search.dart';

class BotaoAbrirPesquisa extends StatelessWidget {
  final SearchbarController controller;

  const BotaoAbrirPesquisa({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return IconButton(
        icon: const Icon(Icons.search),
        tooltip: "Search",
        onPressed: () {
          showSearch(
            context: context,
            delegate: CustomDelegate(controller),
          );
        },
      );
    });
  }
}

class CustomDelegate extends SearchDelegate<String> {
  final SearchbarController controller;

  CustomDelegate(this.controller);

  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isNotEmpty) {
      return [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        )
      ];
    }
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isNotEmpty) {
      controller.setPesquisa(query);
      controller.pesquisar();
    }
    return const SearchScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: controller.sugestoes.length,
          itemBuilder: (context, index) {
            final sugestao = controller.sugestoes.elementAt(index);
            return ListTile(
              title: Text(sugestao),
              onTap: () {
                query = sugestao;
              },
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => controller.removeSuggestion(sugestao),
                tooltip: 'Remove',
              ),
            );
          },
        );
      },
    );
  }
}
