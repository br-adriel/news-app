import 'package:flutter/material.dart';
import 'package:news_app/widgets/botoes/botao_ler_artigo.dart';
import 'package:news_app/widgets/cover_image.dart';
import 'package:news_app/widgets/news_screen_layout/news_first_paragraph.dart';
import 'package:news_app/widgets/news_screen_layout/news_info.dart';
import 'package:news_app/widgets/news_screen_layout/news_title_abstract.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton:
          const BotaoLerArtigo(urlArtigo: 'https://google.com'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: const FlexibleSpaceBar(
              background: CoverImage(imageURL: ''),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 32,
                    left: 16,
                    right: 16,
                    bottom: 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewsTitleAbstract(),
                      SizedBox(height: 16),
                      NewsInfo(),
                      SizedBox(height: 20),
                      NewsFirstParagraph(),
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
