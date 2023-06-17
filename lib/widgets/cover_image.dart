import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String imageURL;
  final String placeholder;
  final double height;
  final BoxFit fit;

  const CoverImage({
    super.key,
    required this.imageURL,
    this.fit = BoxFit.cover,
    this.height = 220,
    this.placeholder = "assets/img/card_placeholder.jpg",
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
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
    );
  }
}
