import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/stores/app_store.dart';



class BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final selectedIndex = AppStore().selectedIndex;
        return BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: AppStore().setIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Recent',
              icon: Icon(Icons.access_time),
            ),
            BottomNavigationBarItem(
              label: 'Popular',
              icon: Icon(Icons.star),
            ),
          ],
        );
      },
    );
  }
}