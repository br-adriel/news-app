import 'package:flutter/material.dart';
import 'package:news_app/widgets/icon_text.dart';

class NewsInfo extends StatelessWidget {
  final String author;
  final String publishDate;
  final int numberOfWords;

  const NewsInfo(
      {super.key,
      this.author = 'unknown',
      this.publishDate = 'unknown',
      this.numberOfWords = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconText(
          icon: Icons.person,
          text: author,
        ),
        const SizedBox(height: 8),
        IconText(
          icon: Icons.calendar_month,
          text: publishDate,
        ),
        const SizedBox(height: 8),
        IconText(
          icon: Icons.keyboard,
          text: "$numberOfWords words",
        ),
      ],
    );
  }
}
