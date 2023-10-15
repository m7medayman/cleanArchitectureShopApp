import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_shop/model/models.dart';
import 'package:mvvm_shop/presentation/Home/base.dart';
import 'package:mvvm_shop/presentation/Home/homePage/cubit/home_cubit.dart';
import 'package:mvvm_shop/presentation/common/text_widget.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer_imp.dart';

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
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Scaffold(body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          print(state);
          if (state is HomeDataLoaded) {
            dismissDialog(context);
            return _body(state);
          } else if (state is HomeLoading) {
            StateScreens.popupLoadingState
                .getPopupDialog(AppStrings.loading, context);
            return Container();
          } else if (state is HomeError) {
            return StateScreens.errorPageState
                .getStateDialog(state.error, context);
          } else {
            return Container();
          }
        },
      )),
    );
  }

  Column _body(HomeDataLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _banner(state.services),
        SizedBox(
          height: AppSize.h20,
        ),
        _services(state.services),
        _stores(state.services)
      ],
    );
  }

  _services(List<ServicesBanner> services) {
    return Container(
      padding: const EdgeInsets.all(AppSize.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText(
            AppStrings.services,
            style: getBoldStyle().copyWith(color: ColorManager.primary),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: services.map((service) {
                return Container(
                  height: AppSize.h150,
                  width: AppSize.h150,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(Routs.detailsRoute, arguments: service.id);
                    },
                    child: Card(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: AppSize.h100,
                              width: double.maxFinite,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: NetworkImage(service.imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppSize.s2),
                              child: myText(
                                service.name,
                                style: getRegularStyle(),
                              ),
                            )
                          ],
                        )),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _stores(List<ServicesBanner> services) {
    return Container(
      padding: EdgeInsets.all(AppSize.s8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        myText(
          AppStrings.stores,
          style: getBoldStyle().copyWith(color: ColorManager.primary),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: services.map((service) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routs.detailsRoute, arguments: service.id);
                },
                child: Container(
                  height: AppSize.h125,
                  width: AppSize.h200,
                  child: Image(
                      image: NetworkImage(service.imageUrl), fit: BoxFit.fill),
                ),
              ),
            );
          }).toList()),
        ),
      ]),
    );
  }

  Container _banner(
    List<ServicesBanner> services,
  ) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.85,
          autoPlay: true,
          aspectRatio: 1.9,
          enlargeFactor: 0.9,
          enlargeCenterPage: true,
        ),
        items: services.map((service) {
          return Container(
            width: double.maxFinite,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Routs.detailsRoute, arguments: service.id);
              },
              child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    image: NetworkImage(service.imageUrl),
                    fit: BoxFit.fill,
                  )),
            ),
          );
        }).toList(),
      ),
    );
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }
}
