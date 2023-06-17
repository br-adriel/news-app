import 'package:flutter/material.dart';
import 'package:news_app/widgets/barra_superior.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraSuperior(
        titulo: 'Noticia #1',
      ),
      body: const Text("Noticia"),
    );
  }
}