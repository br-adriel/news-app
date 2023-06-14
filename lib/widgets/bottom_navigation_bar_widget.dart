import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  final void Function(int)? onTap;
  final int selectedIndex;

  const BottomNavigationBarWidget({super.key, this.onTap, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
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