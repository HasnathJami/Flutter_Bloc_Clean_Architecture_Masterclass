import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              Navigator.pushNamed(context, RoutesName.homeScreen);
            },
            child: Text('Home')),
      ),
    );
  }
}
