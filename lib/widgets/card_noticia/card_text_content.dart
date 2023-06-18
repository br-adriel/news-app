import 'package:flutter/material.dart';

class CardTextContent extends StatelessWidget {
  final String subtitle;
  final String title;

  const CardTextContent(
      {super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
