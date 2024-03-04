import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/home_entity.dart';
import '../../domain/repository/home_repo.dart';
import '../source/remote_home_repo.dart';


class HomeRepositoryImpl extends IHomeRepository {
  final RemoteHomeRepo remoteHomeRepo;

  HomeRepositoryImpl(this.remoteHomeRepo);
  @override
  Future<Either<AppErrorHandler, HomeDataEntity>> requestHomeData(
      String apiUrl) async {
    try {
      final response = await remoteHomeRepo.requestHomeData(apiUrl);
      return response.fold((l) => Left(l), (r) {
        final HomeDataEntity homeDataEntity =
            HomeDataEntity(data: r.data, message: r.message);
        return right(homeDataEntity);
      });
    } catch (e) {
      return left(AppErrorHandler(message: e.toString(), status: false));
    }
  }
}
