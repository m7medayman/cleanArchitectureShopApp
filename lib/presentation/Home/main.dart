import 'package:flutter/material.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';
import 'package:mvvm_shop/presentation/Home/favoritePage/favorite_view.dart';
import 'package:mvvm_shop/presentation/Home/homePage/home_view.dart';
import 'package:mvvm_shop/presentation/Home/notificationsPage/notification_view.dart';
import 'package:mvvm_shop/presentation/Home/searchPage/search_view.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({super.key});

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  int _currentIndex = 0;
  static final List<BaseViewNavigationBarItem> _pages = [
    HomePageView(),
    NotificationPageView(),
    SearchPageView(),
    FavoritePageView(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = (_pages.map((page) {
    return BottomNavigationBarItem(
      icon: page.getIcon(),
      label: page.getName(),
    );
  })).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex].getName()),
      ),
      body: Container(),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTap,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          elevation: 0,
          items: bottomNavigationBarItems,
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
