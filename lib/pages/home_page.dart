import 'package:flutter/material.dart';
import 'package:music_app/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleSpacing: 70,
        title: Text(
          "P L A Y L I S T"
          ),
        ),
      drawer: MyDrawer(),
    );
  }
}