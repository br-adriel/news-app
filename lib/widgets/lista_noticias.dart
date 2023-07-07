import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/models/noticia_model.dart';
import 'package:news_app/widgets/card_noticia/card_noticia.dart';

class ListaNoticias extends HookWidget {
  final List<Noticia> noticias;
  final Future<void> Function() atualizar;
  final Future<void> Function() atingirFim;

  const ListaNoticias(
      {super.key,
      required this.noticias,
      required this.atualizar,
      required this.atingirFim});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollCtrl = useScrollController();

    useEffect(() {
      scrollCtrl.addListener(() {
        if (scrollCtrl.position.maxScrollExtent == scrollCtrl.offset) {
          atingirFim();
        }
      });
      return null;
    }, [scrollCtrl]);

    return RefreshIndicator(
      onRefresh: atualizar,
      child: ListView.builder(
        itemCount: noticias.length + 1,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          if (index < noticias.length) {
            return CardNoticia(noticia: noticias.elementAt(index));
          }
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
