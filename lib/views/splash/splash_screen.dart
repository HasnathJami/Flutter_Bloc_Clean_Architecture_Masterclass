import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Splash Screen', style: TextStyle(fontSize: 50),),
        ),
      ),
    );
  }

}
