import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';

class NotificationPageView extends StatefulWidget
    with BaseViewNavigationBarItem {
  static String name = 'notification';
  static Icon icon = const Icon(Icons.notifications);
  const NotificationPageView({super.key});

  @override
  State<NotificationPageView> createState() => _NotificationPageViewState();

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

class _NotificationPageViewState extends State<NotificationPageView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
