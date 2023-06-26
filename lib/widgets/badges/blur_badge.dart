import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBadge extends StatelessWidget {
  final String text;

  const BlurBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
