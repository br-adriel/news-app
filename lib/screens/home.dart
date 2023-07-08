import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/home_screen.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/widgets/barra_superior.dart';
import 'package:news_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:news_app/widgets/loading_circular.dart';
import 'package:news_app/widgets/menus_popup/menu_periodo.dart';

class HomeScreen extends HookWidget {
  final HomeScreenController homeController = HomeScreenController();
  final SearchbarController searchbarController = SearchbarController();

  HomeScreen({super.key});

  mudarSecao(int index) {
    if (index == 0) {
      homeController.irParaRecentes();
    } else {
      homeController.irParaPopulares();
    }
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      homeController.irParaRecentes();
      return null;
    }, []);

    return Observer(builder: (_) {
      return Scaffold(
        appBar: BarraSuperior(
          titulo: homeController.titulo,
          menuPopup: homeController.secaoAtiva == SecaoAtiva.populares
              ? MenuPeriodo(
                  onSelected: homeController.setPeriodoPopulares,
                  selected: homeController.periodoNoticiasPopulares,
                )
              : null,
          searchbarController: searchbarController,
        ),
        body: homeController.mostrarLoading
            ? const LoadingCircular()
            : ListaNoticias(
                noticias: homeController.noticiasExibidas,
                atualizar: homeController.atualizarSecao,
                atingirFim: homeController.carregarMaisNoticias,
                mostrarSpinner:
                    homeController.secaoAtiva == SecaoAtiva.populares
                        ? false
                        : !homeController.recentesChegouAoFim,
              ),
        bottomNavigationBar: BottomNavigationBarWidget(
            onTap: mudarSecao,
            selectedIndex: homeController.selectedNavbarIndex),
      );
    });
  }
}
