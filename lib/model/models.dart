import 'package:flutter_svg/flutter_svg.dart';

class SlidersView {
  SliderObject sliderObject;
  int sliderCount;
  int currentSlide;
  SlidersView(this.sliderObject, this.currentSlide, this.sliderCount);
}

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.image, this.subTitle, this.title);
}

class ServicesBanner {
  String id;
  String name;
  String imageUrl;
  ServicesBanner({
    this.id = '',
    this.name = '',
    this.imageUrl = '',
  });
}

class StoresBanner {
  String id;
  String name;
  String imageUrl;
  StoresBanner({
    this.id = '',
    this.name = '',
    this.imageUrl = '',
  });
}

class AdsBanner {
  String id;
  String name;
  String imageUrl;
  AdsBanner({
    this.id = '',
    this.name = '',
    this.imageUrl = '',
  });
}

class Details {
  String details;
  String aboutStore;
  String services;
  String imageUrl;
  Details({
    this.details = '',
    this.aboutStore = '',
    this.services = '',
    this.imageUrl = '',
  });
}
