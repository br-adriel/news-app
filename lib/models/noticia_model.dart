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

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      autor: json['byline']['original'],
      dataPublicacao: DateTime.parse(json['pub_date']),
      imagemCapa:
          "${dotenv.env['SITE_BASE_URL']}${json['multimedia'][0]['url']}",
      numeroPalavras: json['word_count'],
      primeiroParagrafo: json['lead_paragraph'],
      subtitulo: json['abstract'],
      titulo: json['headline']['main'],
      url: json['web_url'],
    );
  }
}
