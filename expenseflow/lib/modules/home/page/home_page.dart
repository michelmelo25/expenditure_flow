import 'package:expenseflow/modules/home/widgets/home_body_widget.dart';
import 'package:expenseflow/shared/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBodyWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
