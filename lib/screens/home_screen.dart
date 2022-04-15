import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/caracters_gridview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: const CaractersGridviewWidget(),
    );
  }
}