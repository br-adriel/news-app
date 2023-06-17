import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BotaoLerArtigo extends StatelessWidget {
  final String urlArtigo;

  const BotaoLerArtigo({super.key, required this.urlArtigo});

  Future<void> _abrirArtigoNoNavegador() async {
    await launchUrl(Uri.parse(urlArtigo));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _abrirArtigoNoNavegador,
      tooltip: "Read article",
      child: const Icon(Icons.article),
    );
  }
}
