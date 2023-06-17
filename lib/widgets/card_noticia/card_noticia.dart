import 'package:flutter/material.dart';
import 'package:news_app/widgets/card_noticia/card_image.dart';
import 'package:news_app/widgets/card_noticia/card_text_content.dart';

class CardNoticia extends StatelessWidget {
  final String author;
  final String imageURL;
  final String publishDate;
  final String title;
  final void Function()? onTap;

  const CardNoticia(
      {super.key,
      this.title = 'Unknown title',
      this.author = 'Unknown author',
      this.publishDate = 'No publish date',
      this.imageURL = '',
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardImage(imageURL: imageURL, badgeContent: publishDate),
                CardTextContent(subtitle: author, title: title)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
