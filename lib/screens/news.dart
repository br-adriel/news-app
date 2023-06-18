import 'package:flutter/material.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/utils/datas.dart';
import 'package:news_app/widgets/botoes/botao_ler_artigo.dart';
import 'package:news_app/widgets/cover_image.dart';
import 'package:news_app/widgets/news_screen_layout/news_first_paragraph.dart';
import 'package:news_app/widgets/news_screen_layout/news_info.dart';
import 'package:news_app/widgets/news_screen_layout/news_title_abstract.dart';

class NewsScreen extends StatelessWidget {
  final Noticia noticia;

  const NewsScreen({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: BotaoLerArtigo(urlArtigo: noticia.url),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: CoverImage(imageURL: noticia.imagemCapa),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 16,
                    right: 16,
                    bottom: 88,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewsTitleAbstract(
                          abstract: noticia.subtitulo, title: noticia.titulo),
                      const SizedBox(height: 16),
                      NewsInfo(
                        author: noticia.autor,
                        numberOfWords: noticia.numeroPalavras,
                        publishDate: dataParaString(noticia.dataPublicacao),
                      ),
                      const SizedBox(height: 20),
                      NewsFirstParagraph(paragraph: noticia.primeiroParagrafo),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
