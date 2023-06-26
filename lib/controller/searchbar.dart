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
  bool estaCarregandoPrimeiraVez = true;

  @observable
  bool estaCarrgando = false;

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
    estaCarrgando = true;
    resultados = ObservableList.of([]);

    if (pesquisa.isNotEmpty) {
      if (sugestoes.contains(pesquisa)) {
        sugestoes.removeWhere((element) => element == pesquisa);
      }
      sugestoes.insert(0, pesquisa);
    }

    final String json = await rootBundle.loadString('assets/amostra.json');
    Map<String, dynamic> dados = jsonDecode(json);

    List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
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
  }
}
