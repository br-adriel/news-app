import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/controller/home_screen.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/widgets/barra_superior.dart';
import 'package:news_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:news_app/widgets/loading_circular.dart';
import 'package:news_app/widgets/menus_popup/menu_periodo.dart';

class HomeScreen extends HookWidget {
  final HomeScreenController homeScreenController = HomeScreenController();
  final SearchbarController searchbarController = SearchbarController();

  HomeScreen({super.key});

  mudarSecao(int index) {
    if (index == 0) {
      homeScreenController.irParaRecentes();
    } else {
      homeScreenController.irParaPopulares();
    }
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      homeScreenController.irParaRecentes();
      return null;
    }, []);

    return Observer(builder: (_) {
      ObservableList<Noticia> noticias = homeScreenController.noticiasRecentes;
      bool mostrarLoading = homeScreenController.carregandoRecentesPrimeiraVez;

      if (homeScreenController.secaoAtiva == SecaoAtiva.populares) {
        noticias = homeScreenController.noticiasPopulares;
        mostrarLoading = homeScreenController.carregandoPopularesPrimeiraVez;
      }

      return Scaffold(
        appBar: BarraSuperior(
          titulo: homeScreenController.titulo,
          menuPopup: homeScreenController.secaoAtiva == SecaoAtiva.populares
              ? MenuPeriodo()
              : null,
          searchbarController: searchbarController,
        ),
        body: mostrarLoading
            ? const LoadingCircular()
            : ListaNoticias(noticias: noticias),
        bottomNavigationBar: BottomNavigationBarWidget(
            onTap: mudarSecao,
            selectedIndex: homeScreenController.selectedNavbarIndex),
      );
    });
  }
}
