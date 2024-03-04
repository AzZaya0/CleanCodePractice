
import '../../data/model/home_data_model.dart';

class HomeDataEntity {
  final String? message;
  final Data? data;

  HomeDataEntity({
    this.message,
    this.data,
  });

  factory HomeDataEntity.fromJson(Map<String, dynamic> json) {
    return HomeDataEntity(
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}


