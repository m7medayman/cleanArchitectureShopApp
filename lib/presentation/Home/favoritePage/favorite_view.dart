import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';

class FavoritePageView extends StatefulWidget with BaseViewNavigationBarItem {
  static String name = 'favorite';
  static Icon icon = const Icon(Icons.favorite);
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();

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

class _FavoritePageViewState extends State<FavoritePageView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
