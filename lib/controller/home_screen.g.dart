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
titulo: ${titulo}
    ''';
  }
}
