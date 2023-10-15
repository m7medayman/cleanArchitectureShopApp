import 'package:mvvm_shop/model/models.dart';

class HomeData {
  List<ServicesBanner> services;
  List<StoresBanner> stores;
  List<AdsBanner> bannerAds;
  HomeData({
    this.bannerAds = const [],
    this.services = const [],
    this.stores = const [],
  });

  HomeData copyWith({
    List<ServicesBanner>? services,
    List<StoresBanner>? stores,
    List<AdsBanner>? bannerAds,
  }) {
    return HomeData(
      services: services ?? this.services,
      stores: stores ?? this.stores,
      bannerAds: bannerAds ?? this.bannerAds,
    );
  }
}
