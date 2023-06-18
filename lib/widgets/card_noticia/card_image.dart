import 'package:flutter/material.dart';
import 'package:news_app/widgets/badges/blur_badge.dart';
import 'package:news_app/widgets/cover_image.dart';

class CardImage extends StatelessWidget {
  final String imageURL;
  final String placeholder;
  final double height;
  final BoxFit fit;
  final String? badgeContent;

  const CardImage(
      {super.key,
      required this.imageURL,
      this.fit = BoxFit.cover,
      this.height = 220,
      this.placeholder = "assets/img/card_placeholder.jpg",
      this.badgeContent});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CoverImage(
                  imageURL: imageURL,
                  fit: fit,
                  height: height,
                  placeholder: placeholder,
                ),
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: badgeContent != null
                  ? BlurBadge(text: badgeContent ?? '')
                  : const Text('')),
        ],
      ),
    );
  }
}
