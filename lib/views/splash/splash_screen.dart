import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/components/internet_exception_widget.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/data/exceptions/app_exceptions.dart';

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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // LoadingWidget(),
              // RoundButton(title: 'Click Me', onPress: (){}, height: 100,),
              // TextButton(
              //     onPressed: () {
              //       // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              //       Navigator.pushNamed(context, RoutesName.homeScreen);
              //     },
              //     child: Text('Home')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InternetExceptionWidget(
                  onPress: () {},
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // throw NoInternetException('Oh!');
      }),
    );
  }
}
