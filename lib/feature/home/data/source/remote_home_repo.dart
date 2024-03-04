
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../../core/error/failure.dart';
import '../../domain/entity/home_entity.dart';
import '../model/home_data_model.dart';

class RemoteHomeRepo {
  Dio dio;
  RemoteHomeRepo({
    required this.dio,
  });

  Future<Either<AppErrorHandler, HomeDataEntity>> requestHomeData(
      String apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        var responseModel = HomeDataModel.fromJson(response.data);
        return Right(responseModel);
      } else {
        return left(AppErrorHandler(
            message: response.statusCode.toString(), status: false));
      }
    } on DioException catch (e) {
      return left(
        AppErrorHandler(
          message: e.error as String,
          status: false,
        ),
      );
    } catch (e) {
      return left(AppErrorHandler(message: e.toString(), status: false));
      
    }
  }
}
