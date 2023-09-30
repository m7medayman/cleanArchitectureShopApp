import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';

class HomePageView extends StatefulWidget with BaseViewNavigationBarItem {
  static String name = 'home';
  static Icon icon = Icon(Icons.home_outlined);
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();

  @override
  Icon getIcon() {
    return icon;
  }

  @override
  String getName() {
    return name;
  }
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
