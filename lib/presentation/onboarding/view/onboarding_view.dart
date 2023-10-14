import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_shop/model/models.dart';
import 'package:mvvm_shop/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/font_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  OnboardingViewModel viewModel = OnboardingViewModel();
  PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlidersView>(
        stream: viewModel.outputSlider,
        builder: (context, snapshot) {
          print(snapshot.data);
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: snapshot.hasData
                ? _pageView(snapshot)
                : const CircularProgressIndicator(),
            bottomSheet: snapshot.hasData
                ? _bottomSheet(context, snapshot.data!.currentSlide)
                : Container(),
          );
        });
  }

  PageView _pageView(AsyncSnapshot<SlidersView> snapshot) {
    return PageView.builder(
      itemCount: snapshot.data?.sliderCount,
      onPageChanged: (index) => {viewModel.pageChange(index)},
      controller: controller,
      itemBuilder: ((context, index) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snapshot.data!.sliderObject.title.tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: AppSize.h20,
                ),
                Text(
                  snapshot.data!.sliderObject.subTitle.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: AppSize.h50,
                ),
                SvgPicture.asset(
                  snapshot.data!.sliderObject.image,
                )
              ],
            ),
          )),
    );
  }

  Container _bottomSheet(BuildContext context, currentIndx) {
    return Container(
      color: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                viewModel.skipButton(context);
              },
              child: Text(
                AppStrings.skip,
                style: getMediumStyle(
                    FontColor: ColorManager.primary, size: FontSize.s16),
              )),
          const SizedBox(
            height: AppSize.h20,
          ),
          _pageController(currentIndx)
        ],
      ),
    );
  }

  Container _pageController(currentIndx) {
    return Container(
      height: AppSize.h50,
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _leftArrow(),
            _pageIndicator(currentIndx),
            _rightArrow(),
          ],
        ),
      ),
    );
  }

  InkWell _rightArrow() {
    return InkWell(
      onTap: () {
        controller.animateToPage(viewModel.goNext(),
            duration: const Duration(microseconds: 400),
            curve: Curves.easeInSine);
      }, // the gonext func
      child: SizedBox(
        height: AppSize.s20,
        width: AppSize.s20,
        child: SvgPicture.asset(
          ImageAssets.rightArrow,
        ),
      ),
    );
  }

  Row _pageIndicator(int currentindex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < 4; i++) _circle(i, currentindex),
      ],
    );
  }

  Padding _circle(current, index) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: current == index
          ? SvgPicture.asset(ImageAssets.solidCircle)
          : SvgPicture.asset(ImageAssets.hollowImage),
    );
  }

  GestureDetector _leftArrow() {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(viewModel.goPrevious(),
            duration: const Duration(microseconds: 400),
            curve: Curves.easeInSine);
      }, // the go previous func
      child: RotatedBox(
        quarterTurns: 2,
        child: SizedBox(
          height: AppSize.s20,
          width: AppSize.s20,
          child: SvgPicture.asset(
            ImageAssets.rightArrow,
          ),
        ),
      ),
    );
  }
}
