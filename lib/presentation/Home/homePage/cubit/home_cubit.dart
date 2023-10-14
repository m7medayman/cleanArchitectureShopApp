import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/get_home_data.dart';
import 'package:mvvm_shop/model/models.dart';
import 'package:mvvm_shop/presentation/Home/homePage/cubit/home_data.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late GetHomeDataUseCase _getHomeData;
  late HomeData data;
  HomeCubit() : super(HomeInitial()) {
    print("+++++++++++++++++++++++++++++++++++++++++");
    data = HomeData();
    _initializeData().whenComplete(() {
      getHomeData();
    });
  }

  Future<void> _initializeData() async {
    await initHomeDataModule().whenComplete(() {
      _getHomeData = instance<GetHomeDataUseCase>();
    });
  }

  Future getHomeData() async {
    singleEmit(HomeLoading());
    await _getHomeData.execute(null).fold((error) {
      singleEmit(HomeError(error.message));
    }, (right) {
      data = data.copyWith(
          services: (right.servicesRes.map((service) {
        return ServicesBanner(
            name: service.name, imageUrl: service.imageUrl, id: service.id);
      })).toList());
      singleEmit(HomeDataLoaded(data.services));
    });
  }

  singleEmit(HomeState currentState) {
    if (this.state != currentState) {
      emit(currentState);
    }
  }
}
