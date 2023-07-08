import 'package:mobx/mobx.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/service/noticia_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'searchbar.g.dart';

class SearchbarController = ControllerBase with _$SearchbarController;

abstract class ControllerBase with Store {
  SharedPreferences? prefs;
  int _paginaAtual = 0;
  bool _estaCarregando = false;

  @observable
  String pesquisa = '';

  @observable
  bool estaCarregandoPrimeiraVez = false;

  @observable
  ObservableList<String> sugestoes = ObservableList.of([]);

  @observable
  ObservableList<Noticia> resultados = ObservableList.of([]);

  @observable
  bool chegouAoFim = false;

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

  /// Função que inicia uma pesquisa
  @action
  Future<void> pesquisar() async {
    estaCarregandoPrimeiraVez = true;
    if (pesquisa.isNotEmpty && !_estaCarregando) {
      _paginaAtual = 0;
      chegouAoFim = false;

      _addSuggestion();

      resultados = ObservableList.of([]);
      await carregarOutraPagina();
    }
    estaCarregandoPrimeiraVez = false;
  }

  @action
  Future<void> carregarOutraPagina() async {
    if (pesquisa.isNotEmpty && !_estaCarregando && !chegouAoFim) {
      _estaCarregando = true;

      List<Noticia> noticias =
          await NoticiaService.pesquisarArtigos(pesquisa, _paginaAtual);
      resultados.addAll(noticias);

      if (noticias.isEmpty) {
        chegouAoFim = true;
      }

      _paginaAtual++;
      _estaCarregando = false;
    }
  }
}
