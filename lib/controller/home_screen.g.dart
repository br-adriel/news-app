// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenController on ControllerBase, Store {
  late final _$periodoNoticiasPopularesAtom =
      Atom(name: 'ControllerBase.periodoNoticiasPopulares', context: context);

  @override
  int get periodoNoticiasPopulares {
    _$periodoNoticiasPopularesAtom.reportRead();
    return super.periodoNoticiasPopulares;
  }

  @override
  set periodoNoticiasPopulares(int value) {
    _$periodoNoticiasPopularesAtom
        .reportWrite(value, super.periodoNoticiasPopulares, () {
      super.periodoNoticiasPopulares = value;
    });
  }

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

  late final _$mostrarLoadingAtom =
      Atom(name: 'ControllerBase.mostrarLoading', context: context);

  @override
  bool get mostrarLoading {
    _$mostrarLoadingAtom.reportRead();
    return super.mostrarLoading;
  }

  @override
  set mostrarLoading(bool value) {
    _$mostrarLoadingAtom.reportWrite(value, super.mostrarLoading, () {
      super.mostrarLoading = value;
    });
  }

  late final _$recentesChegouAoFimAtom =
      Atom(name: 'ControllerBase.recentesChegouAoFim', context: context);

  @override
  bool get recentesChegouAoFim {
    _$recentesChegouAoFimAtom.reportRead();
    return super.recentesChegouAoFim;
  }

  @override
  set recentesChegouAoFim(bool value) {
    _$recentesChegouAoFimAtom.reportWrite(value, super.recentesChegouAoFim, () {
      super.recentesChegouAoFim = value;
    });
  }

  late final _$noticiasExibidasAtom =
      Atom(name: 'ControllerBase.noticiasExibidas', context: context);

  @override
  ObservableList<Noticia> get noticiasExibidas {
    _$noticiasExibidasAtom.reportRead();
    return super.noticiasExibidas;
  }

  @override
  set noticiasExibidas(ObservableList<Noticia> value) {
    _$noticiasExibidasAtom.reportWrite(value, super.noticiasExibidas, () {
      super.noticiasExibidas = value;
    });
  }

  late final _$carregarMaisNoticiasAsyncAction =
      AsyncAction('ControllerBase.carregarMaisNoticias', context: context);

  @override
  Future<void> carregarMaisNoticias() {
    return _$carregarMaisNoticiasAsyncAction
        .run(() => super.carregarMaisNoticias());
  }

  late final _$atualizarSecaoAsyncAction =
      AsyncAction('ControllerBase.atualizarSecao', context: context);

  @override
  Future<void> atualizarSecao() {
    return _$atualizarSecaoAsyncAction.run(() => super.atualizarSecao());
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
  void setPeriodoPopulares(int periodo) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPeriodoPopulares');
    try {
      return super.setPeriodoPopulares(periodo);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
periodoNoticiasPopulares: ${periodoNoticiasPopulares},
secaoAtiva: ${secaoAtiva},
titulo: ${titulo},
selectedNavbarIndex: ${selectedNavbarIndex},
mostrarLoading: ${mostrarLoading},
recentesChegouAoFim: ${recentesChegouAoFim},
noticiasExibidas: ${noticiasExibidas}
    ''';
  }
}
