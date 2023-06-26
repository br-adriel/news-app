// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchbar.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchbarController on ControllerBase, Store {
  late final _$pesquisaAtom =
      Atom(name: 'ControllerBase.pesquisa', context: context);

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  late final _$estaCarregandoPrimeiraVezAtom =
      Atom(name: 'ControllerBase.estaCarregandoPrimeiraVez', context: context);

  @override
  bool get estaCarregandoPrimeiraVez {
    _$estaCarregandoPrimeiraVezAtom.reportRead();
    return super.estaCarregandoPrimeiraVez;
  }

  @override
  set estaCarregandoPrimeiraVez(bool value) {
    _$estaCarregandoPrimeiraVezAtom
        .reportWrite(value, super.estaCarregandoPrimeiraVez, () {
      super.estaCarregandoPrimeiraVez = value;
    });
  }

  late final _$estaCarrgandoAtom =
      Atom(name: 'ControllerBase.estaCarrgando', context: context);

  @override
  bool get estaCarrgando {
    _$estaCarrgandoAtom.reportRead();
    return super.estaCarrgando;
  }

  @override
  set estaCarrgando(bool value) {
    _$estaCarrgandoAtom.reportWrite(value, super.estaCarrgando, () {
      super.estaCarrgando = value;
    });
  }

  late final _$sugestoesAtom =
      Atom(name: 'ControllerBase.sugestoes', context: context);

  @override
  ObservableList<String> get sugestoes {
    _$sugestoesAtom.reportRead();
    return super.sugestoes;
  }

  @override
  set sugestoes(ObservableList<String> value) {
    _$sugestoesAtom.reportWrite(value, super.sugestoes, () {
      super.sugestoes = value;
    });
  }

  late final _$resultadosAtom =
      Atom(name: 'ControllerBase.resultados', context: context);

  @override
  ObservableList<Noticia> get resultados {
    _$resultadosAtom.reportRead();
    return super.resultados;
  }

  @override
  set resultados(ObservableList<Noticia> value) {
    _$resultadosAtom.reportWrite(value, super.resultados, () {
      super.resultados = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('ControllerBase.pesquisar', context: context);

  @override
  Future<void> pesquisar() {
    return _$pesquisarAsyncAction.run(() => super.pesquisar());
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void setPesquisa(String termoBusca) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPesquisa');
    try {
      return super.setPesquisa(termoBusca);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSuggestion(String sugestao) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.removeSuggestion');
    try {
      return super.removeSuggestion(sugestao);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pesquisa: ${pesquisa},
estaCarregandoPrimeiraVez: ${estaCarregandoPrimeiraVez},
estaCarrgando: ${estaCarrgando},
sugestoes: ${sugestoes},
resultados: ${resultados}
    ''';
  }
}
