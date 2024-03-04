import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamyogya_intern_task/feature/home/presentation/bloc/home_bloc.dart';
import 'package:kamyogya_intern_task/injection_container/injection_container.dart';

import 'configs/routes/global_key.dart';
import 'configs/routes/route.dart';
import 'configs/routes/route_handler.dart';
import 'configs/theme/app_themes.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  MainInjectionContainer().register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeUseCase: sl()),
      child: MaterialApp(
        theme: theme(),
        onGenerateRoute: generateRoute,
        navigatorKey: gNavigatorKey,
        initialRoute: Routes.homePage,
      ),
    );
  }
}
