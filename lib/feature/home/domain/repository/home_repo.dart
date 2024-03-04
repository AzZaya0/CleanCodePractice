import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/home_entity.dart';


abstract class IHomeRepository {
  Future<Either<AppErrorHandler, HomeDataEntity>> requestHomeData(String apiUrl);
}
