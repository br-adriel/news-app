import 'package:flutter/material.dart';
import 'package:news_app/widgets/barra_superior.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraSuperior(botaoVoltar: true, titulo: "Search articles"),
    );
  }
}
