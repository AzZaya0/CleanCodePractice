

import '../../../injection_container/injection_container.dart';
import '../data/repository/home_repository_impl.dart';
import '../data/source/remote_home_repo.dart';
import '../domain/repository/home_repo.dart';
import '../domain/usecases/home_usecase.dart';
import '../presentation/bloc/home_bloc.dart';

class HomeInjectionContainer {
  void register() {
    //data Source
    sl.registerLazySingleton<RemoteHomeRepo>(() => RemoteHomeRepo(dio: sl()));
    // repository
    sl.registerLazySingleton<IHomeRepository>(() => HomeRepositoryImpl(sl()));
    // useCases
    sl.registerLazySingleton<HomeUseCase>(
        () => HomeUseCase(homeRepository: sl()));
    // bloc
    sl.registerFactory<HomeBloc>(() => HomeBloc(homeUseCase: sl()));
  }
}
