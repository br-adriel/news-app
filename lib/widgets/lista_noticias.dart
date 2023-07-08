import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/widgets/card_noticia/card_noticia.dart';

class ListaNoticias extends HookWidget {
  final List<Noticia> noticias;
  final Future<void> Function() atualizar;
  final Future<void> Function() atingirFim;
  final bool mostrarSpinner;

  const ListaNoticias(
      {super.key,
      required this.noticias,
      required this.atualizar,
      required this.atingirFim,
      required this.mostrarSpinner});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollCtrl = useScrollController();

    useEffect(() {
      scrollCtrl.addListener(() {
        if (scrollCtrl.position.pixels == scrollCtrl.position.maxScrollExtent) {
          atingirFim();
        }
      });
      return null;
    }, [scrollCtrl]);

    return RefreshIndicator(
      onRefresh: atualizar,
      child: ListView.builder(
        controller: scrollCtrl,
        itemCount: noticias.length + 1,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          if (index < noticias.length) {
            return CardNoticia(noticia: noticias.elementAt(index));
          }
          return mostrarSpinner
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const Text("");
        },
      ),
    );
  }
}
