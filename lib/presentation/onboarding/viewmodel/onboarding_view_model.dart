import 'dart:async';

import 'package:mvvm_shop/model/models.dart';
import 'package:mvvm_shop/presentation/base/base_view_model.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInput, OnboardingViewModelOutput {
  final StreamController _streamController = StreamController<SlidersView>();
  late List _pages;
  int _current = 0;
  _postData() {
    inputSliderViewObject
        .add(SlidersView(_pages[_current], _current, _pages.length));
  }

  @override
  // TODO: implement OutputSlider
  Stream<SlidersView> get outputSlider =>
      _streamController.stream.map((page) => page);

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  int goNext() {
    if (_current == _pages.length) {
      _current == 0;
    } else {
      ++_current;
    }
    return _current;
    // TODO: implement goNext
  }

  @override
  int goPrevious() {
    if (_current == 0) {
      _current == _pages.length;
    } else {
      --_current;
    }
    return _current;
    // TODO: implement goPrevious
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;
  @override
  void pageChange(int index) {
    _current = index;
    _postData();
    // TODO: implement pageChange
  }

  @override
  void start() {
    _pages = _getPages();
    _postData();
    print(_pages[_current]);
    // TODO: implement start
  }

  List _getPages() {
    return [
      SliderObject(ImageAssets.onboardingImage1, AppStrings.onBoardingSubTitle1,
          AppStrings.onBoardingTitle1),
      SliderObject(ImageAssets.onboardingImage2, AppStrings.onBoardingSubTitle2,
          AppStrings.onBoardingTitle2),
      SliderObject(ImageAssets.onboardingImage3, AppStrings.onBoardingSubTitle3,
          AppStrings.onBoardingTitle3),
      SliderObject(ImageAssets.onboardingImage4, AppStrings.onBoardingSubTitle4,
          AppStrings.onBoardingTitle4),
    ];
  }
}

abstract class OnboardingViewModelInput {
  int goNext();
  int goPrevious();
  void pageChange(int index);
  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutput {
  Stream<SlidersView> get outputSlider;
}
