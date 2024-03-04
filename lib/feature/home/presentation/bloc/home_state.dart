// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';


import '../../data/model/home_data_model.dart';
import '../../domain/entity/home_entity.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}
class HomeErrorState extends HomeState {}

class HomeLoadedState extends HomeState {
  int itemCount;
  final HomeDataEntity homeDataEntity;

  HomeLoadedState({
    required this.itemCount,
    required this.homeDataEntity,
  });
  @override
  List<Object?> get props => [homeDataEntity, itemCount];
}
