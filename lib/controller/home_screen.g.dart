// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenController on ControllerBase, Store {
  late final _$secaoAtivaAtom =
      Atom(name: 'ControllerBase.secaoAtiva', context: context);

  @override
  SecaoAtiva get secaoAtiva {
    _$secaoAtivaAtom.reportRead();
    return super.secaoAtiva;
  }

  @override
  set secaoAtiva(SecaoAtiva value) {
    _$secaoAtivaAtom.reportWrite(value, super.secaoAtiva, () {
      super.secaoAtiva = value;
    });
  }

  late final _$tituloAtom =
      Atom(name: 'ControllerBase.titulo', context: context);

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  late final _$selectedNavbarIndexAtom =
      Atom(name: 'ControllerBase.selectedNavbarIndex', context: context);

  @override
  int get selectedNavbarIndex {
    _$selectedNavbarIndexAtom.reportRead();
    return super.selectedNavbarIndex;
  }

  @override
  set selectedNavbarIndex(int value) {
    _$selectedNavbarIndexAtom.reportWrite(value, super.selectedNavbarIndex, () {
      super.selectedNavbarIndex = value;
    });
  }

  late final _$noticiasRecentesAtom =
      Atom(name: 'ControllerBase.noticiasRecentes', context: context);

  @override
  ObservableList<Noticia> get noticiasRecentes {
    _$noticiasRecentesAtom.reportRead();
    return super.noticiasRecentes;
  }

  @override
  set noticiasRecentes(ObservableList<Noticia> value) {
    _$noticiasRecentesAtom.reportWrite(value, super.noticiasRecentes, () {
      super.noticiasRecentes = value;
    });
  }

  late final _$carregandoRecentesAtom =
      Atom(name: 'ControllerBase.carregandoRecentes', context: context);

  @override
  bool get carregandoRecentes {
    _$carregandoRecentesAtom.reportRead();
    return super.carregandoRecentes;
  }

  @override
  set carregandoRecentes(bool value) {
    _$carregandoRecentesAtom.reportWrite(value, super.carregandoRecentes, () {
      super.carregandoRecentes = value;
    });
  }

  late final _$carregandoPopularesAtom =
      Atom(name: 'ControllerBase.carregandoPopulares', context: context);

  @override
  bool get carregandoPopulares {
    _$carregandoPopularesAtom.reportRead();
    return super.carregandoPopulares;
  }

  @override
  set carregandoPopulares(bool value) {
    _$carregandoPopularesAtom.reportWrite(value, super.carregandoPopulares, () {
      super.carregandoPopulares = value;
    });
  }

  late final _$carregandoRecentesPrimeiraVezAtom = Atom(
      name: 'ControllerBase.carregandoRecentesPrimeiraVez', context: context);

  @override
  bool get carregandoRecentesPrimeiraVez {
    _$carregandoRecentesPrimeiraVezAtom.reportRead();
    return super.carregandoRecentesPrimeiraVez;
  }

  @override
  set carregandoRecentesPrimeiraVez(bool value) {
    _$carregandoRecentesPrimeiraVezAtom
        .reportWrite(value, super.carregandoRecentesPrimeiraVez, () {
      super.carregandoRecentesPrimeiraVez = value;
    });
  }

  late final _$carregandoPopularesPrimeiraVezAtom = Atom(
      name: 'ControllerBase.carregandoPopularesPrimeiraVez', context: context);

  @override
  bool get carregandoPopularesPrimeiraVez {
    _$carregandoPopularesPrimeiraVezAtom.reportRead();
    return super.carregandoPopularesPrimeiraVez;
  }

  @override
  set carregandoPopularesPrimeiraVez(bool value) {
    _$carregandoPopularesPrimeiraVezAtom
        .reportWrite(value, super.carregandoPopularesPrimeiraVez, () {
      super.carregandoPopularesPrimeiraVez = value;
    });
  }

  late final _$noticiasPopularesAtom =
      Atom(name: 'ControllerBase.noticiasPopulares', context: context);

  @override
  ObservableList<Noticia> get noticiasPopulares {
    _$noticiasPopularesAtom.reportRead();
    return super.noticiasPopulares;
  }

  @override
  set noticiasPopulares(ObservableList<Noticia> value) {
    _$noticiasPopularesAtom.reportWrite(value, super.noticiasPopulares, () {
      super.noticiasPopulares = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic irParaPopulares() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.irParaPopulares');
    try {
      return super.irParaPopulares();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic irParaRecentes() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.irParaRecentes');
    try {
      return super.irParaRecentes();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
secaoAtiva: ${secaoAtiva},
titulo: ${titulo},
selectedNavbarIndex: ${selectedNavbarIndex},
noticiasRecentes: ${noticiasRecentes},
carregandoRecentes: ${carregandoRecentes},
carregandoPopulares: ${carregandoPopulares},
carregandoRecentesPrimeiraVez: ${carregandoRecentesPrimeiraVez},
carregandoPopularesPrimeiraVez: ${carregandoPopularesPrimeiraVez},
noticiasPopulares: ${noticiasPopulares}
    ''';
  }
}
