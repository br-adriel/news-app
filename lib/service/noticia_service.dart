import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/noticia_model.dart';

class NoticiaService {
  // Os atributos estão começando com underline para ficarem privados
  static const String _endpointPesquisa = "search/v2/articlesearch.json";
  static const String _endpointPopulares = "mostpopular/v2/viewed/";

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "${dotenv.env['API_BASE_URL']}",
      queryParameters: {"api-key": dotenv.env['API_KEY']},
    ),
  );

  // declarei a função como estática porque assim dá para usar sem ter que criar
  // um objeto sempre que for chamar o método
  static Future<List<Noticia>> pesquisarArtigos(String termoDeBusca) async {
    // implementei esse método para testar, mas ficou faltando fazer a parte do
    // offset, para puxar a partir do post 20, 30, 40 etc

    Response<String> resposta = await _dio.get(
      _endpointPesquisa, // junta a url base com a parte da url da api de busca
      queryParameters: {
        "q": termoDeBusca, // coloca o termo de busca no fim da URL
      },
    );
    String jsonString = resposta.data.toString();
    Map<String, dynamic> dados = jsonDecode(jsonString);

    if (dados["status"] == "OK") {
      List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
      List<Noticia> noticias =
          noticiasNaoTratadas.map<Noticia>((noticiaNaoTratada) {
        return Noticia.fromJson(noticiaNaoTratada);
      }).toList();
      return noticias;
    }
    return List.empty();
  }
}
