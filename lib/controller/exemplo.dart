import 'package:mobx/mobx.dart';

class Exemplo {
  Observable<String> message = Observable<String>("Olá mundo");

  _changeMessage() {
    if (message.value == "Olá mundo") {
      message.value = "Tchau mundo";
    } else {
      message.value = "Olá mundo";
    }
  }

  late Action changeMessage;

  Exemplo() {
    changeMessage = Action(_changeMessage);
  }
}
