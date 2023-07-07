import 'package:mobx/mobx.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/service/noticia_service.dart';

part 'home_screen.g.dart';

class HomeScreenController = ControllerBase with _$HomeScreenController;

enum SecaoAtiva { recentes, populares }

abstract class ControllerBase with Store {
  int _indicePaginaRecente = 0;
  List<Noticia> _noticiasRecentes = [];
  List<Noticia> _noticiasPopulares = [];

  @observable
  int periodoNoticiasPopulares = 1;

  @observable
  SecaoAtiva secaoAtiva = SecaoAtiva.recentes;

  @observable
  String titulo = "Latest news";

  @observable
  int selectedNavbarIndex = 0;

  bool _carregandoRecentes = false;
  bool _carregandoPopulares = false;

  bool _carregandoRecentesPrimeiraVez = true;
  bool _carregandoPopularesPrimeiraVez = true;

  @observable
  bool mostrarLoading = true;

  @observable
  ObservableList<Noticia> noticiasExibidas = ObservableList.of([]);

  Future<void> _carregarNoticiasRecentes() async {
    if (!_carregandoRecentes) {
      _carregandoRecentes = true;

      List<Noticia> noticiasCarregadas =
          await NoticiaService.pesquisarArtigos('', _indicePaginaRecente);
      _noticiasRecentes.addAll(noticiasCarregadas);
      noticiasExibidas = ObservableList.of(_noticiasRecentes);

      if (_carregandoRecentesPrimeiraVez == true) {
        _carregandoRecentesPrimeiraVez = false;
      }

      _indicePaginaRecente++;
      _carregandoRecentes = false;
      mostrarLoading = false;
    }
  }

  Future<void> _carregarNoticiasPopulares() async {
    if (!_carregandoPopulares) {
      _carregandoPopulares = true;

      List<Noticia> noticiasCarregadas =
          await NoticiaService.obterPostsPopulares(periodoNoticiasPopulares);
      _noticiasPopulares.addAll(noticiasCarregadas);
      noticiasExibidas = ObservableList.of(_noticiasPopulares);

      if (_carregandoPopularesPrimeiraVez == true) {
        _carregandoPopularesPrimeiraVez = false;
      }

      _carregandoPopulares = false;
      mostrarLoading = false;
    }
  }

  @action
  irParaPopulares() {
    if (secaoAtiva != SecaoAtiva.populares) {
      secaoAtiva = SecaoAtiva.populares;
      titulo = "Popular news";
      selectedNavbarIndex = 1;

      if (_carregandoPopularesPrimeiraVez) {
        mostrarLoading = true;
        _carregarNoticiasPopulares();
      } else {
        noticiasExibidas = ObservableList.of(_noticiasPopulares);
      }
    }
  }

  @action
  irParaRecentes() {
    if (secaoAtiva != SecaoAtiva.recentes || _carregandoRecentesPrimeiraVez) {
      secaoAtiva = SecaoAtiva.recentes;
      titulo = "Latest news";
      selectedNavbarIndex = 0;

      if (_carregandoRecentesPrimeiraVez) {
        mostrarLoading = true;
        _indicePaginaRecente = 0;
        _carregarNoticiasRecentes();
      } else {
        noticiasExibidas = ObservableList.of(_noticiasRecentes);
      }
    }
  }

  @action
  carregarMaisRecentes() {
    _carregarNoticiasRecentes();
  }

  _atualizarRecentes() {
    _indicePaginaRecente = 0;
    _noticiasRecentes = List.of([]);
    _carregandoRecentesPrimeiraVez = true;
    mostrarLoading = true;
    _carregarNoticiasRecentes();
  }

  _atualizarPopulares() {
    _noticiasPopulares = List.of([]);
    _carregandoPopularesPrimeiraVez = true;
    mostrarLoading = true;
    _carregarNoticiasPopulares();
  }

  @action
  Future<void> atualizarSecao() async {
    if (secaoAtiva == SecaoAtiva.recentes) {
      _atualizarRecentes();
    } else {
      _atualizarPopulares();
    }
  }

  @action
  void setPeriodoPopulares(int periodo) {
    periodoNoticiasPopulares = periodo;
    _atualizarPopulares();
  }
}
