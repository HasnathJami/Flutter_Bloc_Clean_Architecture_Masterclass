import 'package:flutter_bloc_clean_architecture_masterclass/config/app_url.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/data/network/network_services_api.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/model/movies/movies.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  final _apiServices = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMovieListApi);
    return MoviesModel.fromJson(response);
  }
}
