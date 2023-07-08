import 'package:flutter_dotenv/flutter_dotenv.dart';

class Noticia {
  final String autor;
  final DateTime dataPublicacao;
  final String imagemCapa;
  final String primeiroParagrafo;
  final int numeroPalavras;
  final String subtitulo;
  final String titulo;
  final String url;

  const Noticia({
    required this.autor,
    required this.dataPublicacao,
    required this.imagemCapa,
    required this.numeroPalavras,
    required this.primeiroParagrafo,
    required this.subtitulo,
    required this.titulo,
    required this.url,
  });

  factory Noticia.fromJsonPesquisa(Map<String, dynamic> json) {
    return Noticia(
      autor: json['byline']['original'] ?? 'Unknown author',
      dataPublicacao: DateTime.parse(json['pub_date']),
      imagemCapa: json['multimedia'] != null && json['multimedia'].length > 0
          ? "${dotenv.env['SITE_BASE_URL']}${json['multimedia'][0]['url']}"
          : "",
      numeroPalavras: json['word_count'],
      primeiroParagrafo: json['lead_paragraph'],
      subtitulo: json['abstract'],
      titulo: json['headline']['main'],
      url: json['web_url'],
    );
  }

  factory Noticia.fromJsonPopulares(Map<String, dynamic> json) {
    return Noticia(
      autor: json['byline'] ?? 'Unknown author',
      dataPublicacao: DateTime.parse(json['published_date']),
      imagemCapa: json['media'].length > 0
          ? "${json['media'][0]['media-metadata'][2]['url']}"
          : "",
      numeroPalavras: 0,
      primeiroParagrafo: 'Unavailable',
      subtitulo: json['abstract'],
      titulo: json['title'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    return titulo;
  }
}
