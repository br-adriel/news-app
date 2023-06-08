import 'package:mobx/mobx.dart';
part 'exemplo.g.dart';

class Exemplo = ControllerBase with _$Exemplo;

abstract class ControllerBase with Store {
  @observable
  String message = "Olá mundo";

  @action
  changeMessage() {
    if (message == "Olá mundo") {
      message = "Tchau mundo";
    } else {
      message = "Olá mundo";
    }
  }
}
