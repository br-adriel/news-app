import 'package:flutter/material.dart';
import 'package:news_app/screens/search.dart';

class BotaoAbrirPesquisa extends StatelessWidget {
  const BotaoAbrirPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.search),
        tooltip: "Search",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        });
  }
}
