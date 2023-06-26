import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/home_screen.dart';
import 'package:news_app/controller/searchbar.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/widgets/barra_superior.dart';
import 'package:news_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:news_app/widgets/card_noticia/card_noticia.dart';
import 'package:news_app/widgets/menus_popup/menu_periodo.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController homeScreenController = HomeScreenController();
  final SearchbarController searchbarController = SearchbarController();

  final Noticia noticiaTeste = Noticia.fromJson(
    {
      "abstract":
          "The accounts in the 49-page indictment reveal a shocking indifference toward some of the country’s most sensitive secrets.",
      "web_url":
          "https://www.nytimes.com/2023/06/09/us/politics/trump-indictment-documents-handling.html",
      "lead_paragraph":
          "If one theme emerged from the account presented by prosecutors in the indictment of former President Donald J. Trump that was unsealed on Friday, it was that even after months of relentless news reporting on the case, Mr. Trump’s handling of classified documents was more cavalier — and his efforts to obstruct the government’s attempts to retrieve them more blatant — than was previously known.",
      "multimedia": [
        {
          "rank": 0,
          "subtype": "xlarge",
          "caption": null,
          "credit": null,
          "type": "image",
          "url":
              "images/2023/06/09/multimedia/09dc-assess-01-qclb/09dc-assess-01-qclb-articleLarge.jpg",
          "height": 400,
          "width": 600,
          "legacy": {
            "xlarge":
                "images/2023/06/09/multimedia/09dc-assess-01-qclb/09dc-assess-01-qclb-articleLarge.jpg",
            "xlargewidth": 600,
            "xlargeheight": 400
          },
          "subType": "xlarge",
          "crop_name": "articleLarge"
        },
      ],
      "headline": {
        "main":
            "Indictment Presents Evidence Trump’s Actions Were More Blatant Than Known",
        "kicker": "News Analysis",
        "content_kicker": null,
        "print_headline": null,
        "name": null,
        "seo": null,
        "sub": null
      },
      "pub_date": "2023-06-09T21:32:11+0000",
      "byline": {
        "original": "By Alan Feuer and Maggie Haberman",
        "person": [
          {
            "firstname": "Alan",
            "middlename": null,
            "lastname": "Feuer",
            "qualifier": null,
            "title": null,
            "role": "reported",
            "organization": "",
            "rank": 1
          },
          {
            "firstname": "Maggie",
            "middlename": null,
            "lastname": "Haberman",
            "qualifier": null,
            "title": null,
            "role": "reported",
            "organization": "",
            "rank": 2
          }
        ],
        "organization": null,
      },
      "word_count": 770,
    },
  );

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
    return Observer(builder: (_) {
      return Scaffold(
        appBar: BarraSuperior(
          titulo: homeScreenController.titulo,
          menuPopup: homeScreenController.secaoAtiva == SecaoAtiva.populares
              ? MenuPeriodo()
              : null,
          searchbarController: searchbarController,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: CardNoticia(
              noticia: noticiaTeste,
            )),
        bottomNavigationBar: BottomNavigationBarWidget(
            onTap: mudarSecao,
            selectedIndex: homeScreenController.selectedNavbarIndex),
      );
    });
  }
}
