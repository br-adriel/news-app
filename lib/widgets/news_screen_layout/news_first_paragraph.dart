import 'package:flutter/material.dart';

class NewsFirstParagraph extends StatelessWidget {
  final String paragraph;

  const NewsFirstParagraph(
      {super.key, this.paragraph = 'first paragraph unavailable'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.indigo.shade50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "First paragraph:",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(paragraph),
          ],
        ),
      ),
    );
  }
}
