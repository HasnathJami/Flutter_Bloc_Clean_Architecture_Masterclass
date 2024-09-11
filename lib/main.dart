import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Clean Code',
      initialRoute: RoutesName.loginScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
