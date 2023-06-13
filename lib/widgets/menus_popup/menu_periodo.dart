import 'package:flutter/material.dart';

class MenuPeriodo extends StatelessWidget {
  final List<dynamic> opcoes = [
    {
      "titulo": 'Today',
      "valor": 1,
    },
    {
      "titulo": 'This week',
      "valor": 7,
    },
    {
      "titulo": 'This month',
      "valor": 30,
    },
  ];
  final void Function(int)? onSelected;

  MenuPeriodo({super.key, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      initialValue: 1,
      tooltip: "Date range",
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return opcoes.map<PopupMenuItem<int>>((op) {
          return PopupMenuItem<int>(
            value: op['valor'],
            child: Text(op['titulo']),
          );
        }).toList();
      },
      onSelected: onSelected,
    );
  }
}
