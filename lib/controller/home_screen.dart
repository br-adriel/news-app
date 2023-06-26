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

  @observable
  bool carregandoRecentes = false;

  @observable
  bool carregandoPopulares = false;

  @observable
  bool carregandoRecentesPrimeiraVez = true;

  @observable
  bool carregandoPopularesPrimeiraVez = true;

  @observable
  ObservableList<Noticia> noticiasPopulares = ObservableList.of([]);

  Future<void> _carregarNoticiasRecentes() async {
    if (carregandoRecentesPrimeiraVez == true) {
      final String jsonString =
          await rootBundle.loadString('assets/amostra.json');

      // simula request a api  ---------------------------------------------------
      Map<String, dynamic> dados = jsonDecode(jsonString);
      Future.delayed(const Duration(seconds: 1));
      // -------------------------------------------------------------------------

      List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
      noticiasRecentes.addAll(
        noticiasNaoTratadas.map<Noticia>((noticiaNaoTratada) {
          return Noticia.fromJson(noticiaNaoTratada);
        }),
      );
      carregandoRecentesPrimeiraVez = false;
    }
  }

  Future<void> _carregarNoticiasPopulares() async {
    if (carregandoPopularesPrimeiraVez == true) {
      final String jsonString =
          await rootBundle.loadString('assets/amostra.json');

      // simula request a api  ---------------------------------------------------
      Map<String, dynamic> dados = jsonDecode(jsonString);
      Future.delayed(const Duration(seconds: 1));
      // -------------------------------------------------------------------------

      List<dynamic> noticiasNaoTratadas = dados["response"]["docs"];
      noticiasPopulares.addAll(
        noticiasNaoTratadas
            .map<Noticia>((noticiaNaoTratada) {
              return Noticia.fromJson(noticiaNaoTratada);
            })
            .toList()
            .reversed, // apenas para diferenciar as duas lista, remover depois
      );
      carregandoPopularesPrimeiraVez = false;
    }
  }

  @action
  irParaPopulares() {
    if (secaoAtiva != SecaoAtiva.populares) {
      secaoAtiva = SecaoAtiva.populares;
      titulo = "Popular news";
      selectedNavbarIndex = 1;
      _carregarNoticiasPopulares();
    }
  }

  @action
  irParaRecentes() {
    if (secaoAtiva != SecaoAtiva.recentes || carregandoRecentesPrimeiraVez) {
      secaoAtiva = SecaoAtiva.recentes;
      titulo = "Latest news";
      selectedNavbarIndex = 0;
      _carregarNoticiasRecentes();
    }
  }
}
