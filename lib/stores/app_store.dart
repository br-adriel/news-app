import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setIndex(int index) {
    selectedIndex = index;
  }
}