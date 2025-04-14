import 'package:flutter/material.dart';

import 'package:quizzz/home/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : supper(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(),
    );
  }
}
