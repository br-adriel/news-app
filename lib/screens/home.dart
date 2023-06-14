import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/home_screen.dart';
import 'package:news_app/widgets/barra_superior.dart';
import 'package:news_app/widgets/menus_popup/menu_periodo.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController homeScreenController = HomeScreenController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: BarraSuperior(
          botaoPesquisar: true,
          titulo: homeScreenController.titulo,
          menuPopup: homeScreenController.secaoAtiva == SecaoAtiva.populares
              ? MenuPeriodo()
              : null,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: homeScreenController.irParaPopulares,
              child: const Text("Seção popular"),
            ),
            ElevatedButton(
              onPressed: homeScreenController.irParaRecentes,
              child: const Text("Seção recetes"),
            ),
          ]),
        ),
      );
    });
  }
}
