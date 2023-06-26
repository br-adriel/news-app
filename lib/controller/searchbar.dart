import 'package:mobx/mobx.dart';
part 'searchbar.g.dart';

class SearchbarController = ControllerBase with _$SearchbarController;

abstract class ControllerBase with Store {
  @observable
  String pesquisa = '';

  @observable
  ObservableList<String> sugestoes = ObservableList.of([]);

  @observable
  ObservableList<String> resultados = ObservableList.of([]);

  @action
  void setPesquisa(String termoBusca) {
    pesquisa = termoBusca.trim();
  }

  @action
  void removeSuggestion(String sugestao) {
    sugestoes.removeWhere((item) => item == sugestao);
  }

  @action
  void pesquisar() {
    resultados = ObservableList.of([]);
    if (pesquisa.isNotEmpty) {
      if (sugestoes.contains(pesquisa)) {
        sugestoes.removeWhere((element) => element == pesquisa);
      }
      sugestoes.insert(0, pesquisa);
    }

    List<String> frutas = [
      "Abacate",
      "Abacaxi",
      "Banana",
      "Maçã",
      "Pera",
      "Uva"
    ];
    resultados = ObservableList.of(
      frutas.where(
        (fruta) => fruta.toLowerCase().contains(pesquisa.toLowerCase()),
      ),
    );
  }
}
