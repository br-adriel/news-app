import 'package:flutter/material.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/widgets/botoes/botao_abrir_pesquisa.dart';

class BarraSuperior extends StatelessWidget implements PreferredSizeWidget {
  final String? titulo;
  final dynamic menuPopup;
  final List<Widget> acoes = [];
  final SearchbarController searchbarController;

  BarraSuperior({
    super.key,
    this.titulo,
    this.menuPopup,
    required this.searchbarController,
  }) {
    acoes.add(BotaoAbrirPesquisa(controller: searchbarController));
    if (menuPopup != null) {
      acoes.add(menuPopup as Widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titulo != null ? Text(titulo!) : null,
      actions: acoes,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
