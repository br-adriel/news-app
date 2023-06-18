import 'package:flutter/material.dart';
import 'package:news_app/screens/news.dart';
import 'package:news_app/utils/datas.dart';
import 'package:news_app/widgets/card_noticia/card_image.dart';
import 'package:news_app/widgets/card_noticia/card_text_content.dart';

import '../../models/noticia_model.dart';

class CardNoticia extends StatelessWidget {
  final Noticia noticia;

  const CardNoticia({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsScreen(noticia: noticia),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardImage(
                    imageURL: noticia.imagemCapa,
                    badgeContent: dataParaString(noticia.dataPublicacao)),
                CardTextContent(subtitle: noticia.autor, title: noticia.titulo)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
