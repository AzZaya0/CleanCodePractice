import 'package:kamyogya_intern_task/feature/home/data/model/home_data_model.dart';

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

class DataEntity {
  final List<MemberEntity>? members;
  final int? currentPage;
  final int? lastPage;
  final String? nextPageUrl;
  final dynamic prevPageUrl;
  final int? perPage;

  DataEntity({
    this.members,
    this.currentPage,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
    this.perPage,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      members: json['members'] != null
          ? (json['members'] as List)
              .map((e) => MemberEntity.fromJson(e))
              .toList()
          : null,
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
      perPage: json['per_page'],
    );
  }
}

class MemberEntity {
  final String? id;
  final String? image;
  final String? name;
  final String? classification;
  final String? email;
  final String? phone;
  final String? club;

  MemberEntity({
    this.id,
    this.image,
    this.name,
    this.classification,
    this.email,
    this.phone,
    this.club,
  });

  factory MemberEntity.fromJson(Map<String, dynamic> json) {
    return MemberEntity(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      classification: json['classification'],
      email: json['email'],
      phone: json['phone'],
      club: json['club'],
    );
  }
}
