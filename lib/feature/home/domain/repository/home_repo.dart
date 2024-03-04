import 'package:dartz/dartz.dart';
import 'package:kamyogya_intern_task/feature/home/domain/entity/home_entity.dart';

import '../../../../core/error/failure.dart';


abstract class IHomeRepository {
  Future<Either<AppErrorHandler, HomeDataEntity>> requestHomeData(String apiUrl);
}
