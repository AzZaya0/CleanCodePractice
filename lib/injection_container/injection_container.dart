import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kamyogya_intern_task/feature/home/injection_container/home_injection_container.dart';

final sl = GetIt.instance;

class MainInjectionContainer {
  Future<void> register() async {
    sl.registerSingleton<Dio>(Dio());

    HomeInjectionContainer().register();
  }
}
