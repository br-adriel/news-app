import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return const Scaffold(
        body: Text("Resultados da busca"),
      );
    });
  }
}
