import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/services/storage/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(onPressed: (){
            LocalStorage localStorage = LocalStorage();
            localStorage.clearValue('token').then((value){
              localStorage.clearValue('isLoggedIn').then((value){
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
