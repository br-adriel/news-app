import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'searchbar.g.dart';

class SearchbarController = ControllerBase with _$SearchbarController;

abstract class ControllerBase with Store {
  SharedPreferences? prefs;

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

  void _addSuggestion() {
    // se o usuario busca por uma sugestão antiga, ela é removida e adicionada
    // novamente no inicio da lista de sugestoes
    if (sugestoes.contains(pesquisa)) {
      sugestoes.removeWhere((element) => element == pesquisa);
    }
    sugestoes.insert(0, pesquisa);
    if (sugestoes.length > 10) {
      sugestoes.removeLast();
    }
  }

  @action
  void removeSuggestion(String sugestao) {
    sugestoes.removeWhere((item) => item == sugestao);
  }

  @action
  Future<void> initSuggestions() async {
    prefs ??= await SharedPreferences.getInstance();
    if (prefs != null) {
      List<String>? sugestoesArmazenadas = prefs?.getStringList('sugestoes');
      if (sugestoesArmazenadas != null) {
        sugestoes = ObservableList.of(sugestoesArmazenadas);
      }
    }
  }

  @action
  Future<void> storeSeggestions() async {
    // salva lista no dispositivo
    prefs ??= await SharedPreferences.getInstance();
    if (prefs != null) {
      prefs?.setStringList('sugestoes', sugestoes.toList());
    }
  }

  @action
  Future<void> pesquisar() async {
    if (pesquisa.isNotEmpty) {
      estaCarregandoPrimeiraVez = true;
      resultados = ObservableList.of([]);

      _addSuggestion();
    }

    final String json = await rootBundle.loadString('assets/amostra.json');
    Map<String, dynamic> dados = jsonDecode(json);

    // imita consulta na api  --------------------------------------------------
    List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
    await Future.delayed(const Duration(seconds: 1));
    // -------------------------------------------------------------------------

    List<Noticia> noticias = noticiasNaoTratadas
        .map<Noticia>(
          (noticiaNaoTratada) => Noticia.fromJsonPesquisa(noticiaNaoTratada),
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
