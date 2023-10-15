import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/fetch_details_data.dart';
import 'package:mvvm_shop/model/models.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  String id;
  late FetchDetailsDataUseCase useCase;
  DetailsCubit(this.id) : super(DetailsInitial()) {
    emit(DetailsFetchLoading());
    initModule().whenComplete(() {
      _fetchData();
    });
  }

  Future initModule() async {
    await initDetailsDataModule();
    useCase = instance<FetchDetailsDataUseCase>();
  }

  _fetchData() {
    emit(DetailsFetchLoading());
    useCase.execute(id).fold((error) {
      emit(DetailsFetchFailure(error.message));
    }, (details) {
      emit(DetailsFetchSuccess(Details(
          imageUrl: details.imageUrl,
          services: details.services,
          details: details.details,
          aboutStore: details.aboutStore)));
    });
  }
}
