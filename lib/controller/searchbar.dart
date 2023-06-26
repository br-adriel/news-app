import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/noticia_model.dart';
part 'searchbar.g.dart';

class SearchbarController = ControllerBase with _$SearchbarController;

abstract class ControllerBase with Store {
  @observable
  String pesquisa = '';

  @observable
  bool estaCarregandoPrimeiraVez = false;

  @observable
  bool estaCarregando = false;

  @observable
  ObservableList<String> sugestoes = ObservableList.of([]);

  @observable
  ObservableList<Noticia> resultados = ObservableList.of([]);

  @action
  void setPesquisa(String termoBusca) {
    pesquisa = termoBusca.trim();
  }

  @action
  void removeSuggestion(String sugestao) {
    sugestoes.removeWhere((item) => item == sugestao);
  }

  @action
  Future<void> pesquisar() async {
    if (pesquisa.isNotEmpty) {
      estaCarregandoPrimeiraVez = true;
      resultados = ObservableList.of([]);

      // se o usuario busca por uma sugestão antiga, ela é removida e adicionada
      // novamente no inicio da lista de sugestoes
      if (sugestoes.contains(pesquisa)) {
        sugestoes.removeWhere((element) => element == pesquisa);
      }
      sugestoes.insert(0, pesquisa);
    }

    final String json = await rootBundle.loadString('assets/amostra.json');
    Map<String, dynamic> dados = jsonDecode(json);

    // imita consulta na api  --------------------------------------------------
    List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
    await Future.delayed(const Duration(seconds: 1));
    // -------------------------------------------------------------------------

    List<Noticia> noticias = noticiasNaoTratadas
        .map<Noticia>(
          (noticiaNaoTratada) => Noticia.fromJson(noticiaNaoTratada),
        )
        .toList();

    resultados = ObservableList.of(
      noticias.where(
        (noticia) =>
            noticia.titulo.toLowerCase().contains(pesquisa.toLowerCase()),
      ),
    );
    estaCarregandoPrimeiraVez = false;
  }
}
