import 'package:flutter/material.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/widgets/card_noticia/card_noticia.dart';

class ListaNoticias extends StatelessWidget {
  final List<Noticia> noticias;

  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return CardNoticia(noticia: noticias.elementAt(index));
      },
    );
  }
}
