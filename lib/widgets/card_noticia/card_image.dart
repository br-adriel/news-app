import 'package:flutter/material.dart';
import 'package:news_app/widgets/badges/blur_badge.dart';

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
                FadeInImage.assetNetwork(
                  placeholder: placeholder,
                  image: imageURL,
                  fit: fit,
                  height: height,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      placeholder,
                      fit: fit,
                      height: height,
                    );
                  },
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
