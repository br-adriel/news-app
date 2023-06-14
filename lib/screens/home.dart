import 'package:flutter/material.dart';
import 'package:news_app/controller/exemplo.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final controller = Exemplo();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) => Text(controller.message)),
            ElevatedButton(
              onPressed: controller.changeMessage,
              child: const Text("Alterar mensagem"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
