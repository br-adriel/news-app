import 'package:flutter/material.dart';

class NoArticlesFound extends StatelessWidget {
  const NoArticlesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 40,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              "No articles found",
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
      ],
    );
  }
}
