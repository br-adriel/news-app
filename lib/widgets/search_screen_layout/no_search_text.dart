import 'package:flutter/material.dart';

class NoSearchText extends StatelessWidget {
  const NoSearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 40,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              "Use the search bar to look for articles",
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
      ],
    );
  }
}
