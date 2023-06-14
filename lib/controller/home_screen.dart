import 'package:mobx/mobx.dart';
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
    }
  }
}
