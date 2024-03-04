import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/home_entity.dart';
import '../repository/home_repo.dart';

class HomeUseCase extends UseCase<HomeDataEntity, ApiParams> {
  IHomeRepository homeRepository;
  HomeUseCase({
    required this.homeRepository,
  });
  @override
  Future<Either<AppErrorHandler, HomeDataEntity>> call(ApiParams parms) async {
    final data = await homeRepository.requestHomeData(parms.apiFromTextBox);
    return data.fold((l) => left(l), (r) async => Right(r));
  }
}

class ApiParams {
  final String apiFromTextBox;

  ApiParams({
    required this.apiFromTextBox,
  });
}
