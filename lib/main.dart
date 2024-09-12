import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/repository/auth/login_http_api_repository.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/repository/auth/login_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Clean Code',
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
}
