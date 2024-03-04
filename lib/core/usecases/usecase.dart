import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Parms> {
  Future<Either<AppErrorHandler, Type>> call(Parms parms);
}
