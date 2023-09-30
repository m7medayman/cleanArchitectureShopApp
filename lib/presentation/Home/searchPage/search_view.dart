import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';

class SearchPageView extends StatefulWidget with BaseViewNavigationBarItem {
  static String name = 'search';
  static Icon icon = const Icon(Icons.search);
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();

  @override
  Icon getIcon() {
    // TODO: implement getIcon
    return icon;
  }

  @override
  String getName() {
    // TODO: implement getName
    return name;
  }
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
