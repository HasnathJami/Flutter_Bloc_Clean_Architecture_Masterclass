import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/bloc/movies/movies_bloc.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/components/internet_exception_widget.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/main.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/services/storage/local_storage.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();
    _moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    _moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                LocalStorage localStorage = LocalStorage();
                localStorage.clearValue('token').then((value) {
                  localStorage.clearValue('isLoggedIn').then((value) {
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: BlocProvider(
          create: (_) => _moviesBloc..add(MoviesFetched()),
          child:
              BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
            switch (state.apiResponse.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.completed:
                if (state.apiResponse.data == null) {
                  return const Center(child: Text('No Data Found'));
                }
                final movieList = state.apiResponse.data!;
                return ListView.builder(
                    itemCount: movieList.tvShow.length,
                    itemBuilder: (context, index) {
                      final tvShow = movieList.tvShow[index];
                      return Card(
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage(tvShow.imageThumbnailPath)
                          ),
                          title: Text(tvShow.name.toString()),
                          subtitle: Text(tvShow.network.toString()),
                          trailing: Text(tvShow.status.toString()),
                        ),
                      );
                    });
              case Status.error:
                if (state.apiResponse.message == 'No Internet Connection') {
                  return InternetExceptionWidget(onPress: () {
                    _moviesBloc.add(MoviesFetched());
                  });
                }
                return Center(
                    child: Text(state.apiResponse.message.toString()));
              default:
                return const SizedBox();
            }
          })),
    );
  }
}
