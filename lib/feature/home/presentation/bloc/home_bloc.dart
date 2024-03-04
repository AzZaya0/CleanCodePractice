import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../configs/routes/global_key.dart';
import '../../../../configs/routes/route.dart';
import '../../domain/entity/home_entity.dart';
import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeUseCase homeUseCase;
  HomeBloc({
    required this.homeUseCase,
  }) : super(HomeInitState()) {
    on<GetHomeData>(getHomeData);
  }

  FutureOr<void> getHomeData(GetHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      HomeDataEntity? entity;
      var data = await homeUseCase(ApiParams(apiFromTextBox: event.apiUrl));
      data.fold((l) => left(emit(HomeErrorState())), (r) {
        gNavigator?.pushNamed(Routes.secondPage);
        entity = r;
      });
      for (var i = 0; i < 4; i++) {
        emit(HomeLoadedState(homeDataEntity: entity!, itemCount: i));
        await Future.delayed(const Duration(seconds: 3));
      }
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}
