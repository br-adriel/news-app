import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/noticia_model.dart';

part 'home_screen.g.dart';

class HomeScreenController = ControllerBase with _$HomeScreenController;

enum SecaoAtiva { recentes, populares }

abstract class ControllerBase with Store {
  @observable
  SecaoAtiva secaoAtiva = SecaoAtiva.recentes;

  @observable
  String titulo = "Latest news";

  @observable
  int selectedNavbarIndex = 0;

  @observable
  ObservableList<Noticia> noticiasRecentes = ObservableList.of([]);

  @action
  irParaPopulares() {
    if (secaoAtiva != SecaoAtiva.populares) {
      secaoAtiva = SecaoAtiva.populares;
      titulo = "Popular news";
      selectedNavbarIndex = 1;
    }
  }

  @action
  irParaRecentes() {
    if (secaoAtiva != SecaoAtiva.recentes) {
      secaoAtiva = SecaoAtiva.recentes;
      titulo = "Latest news";
      selectedNavbarIndex = 0;
      carregarNoticiasRecentes();
    }
  }

  @action
  Future<void> carregarNoticiasRecentes() async {
    final String jsonString =
        await rootBundle.loadString('assets/amostra.json');
    Map<String, dynamic> dados = jsonDecode(jsonString);
    List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
    noticiasRecentes.addAll(
      noticiasNaoTratadas.map<Noticia>((noticiaNaoTratada) {
        return Noticia.fromJson(noticiaNaoTratada);
      }),
    );
  }
}
