import 'package:flutter/material.dart';
import 'package:news_app/widgets/botoes/botao_abrir_pesquisa.dart';
import 'package:news_app/widgets/botoes/botao_voltar.dart';

class BarraSuperior extends StatelessWidget implements PreferredSizeWidget {
  final String? titulo;
  final bool botaoVoltar;
  final bool botaoPesquisar;
  final dynamic menuPopup;
  final List<Widget> acoes = [];

  BarraSuperior(
      {super.key,
      this.titulo,
      this.menuPopup,
      this.botaoPesquisar = false,
      this.botaoVoltar = false}) {
    if (botaoPesquisar) {
      acoes.add(const BotaoAbrirPesquisa());
    }
    if (menuPopup != null) {
      acoes.add(menuPopup as Widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: botaoVoltar ? const BotaoVoltar() : null,
      title: titulo != null ? Text(titulo!) : null,
      actions: acoes,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
