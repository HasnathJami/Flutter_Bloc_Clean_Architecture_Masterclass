import 'package:flutter_bloc_clean_architecture_masterclass/config/app_url.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/data/network/network_services_api.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/model/user/user_model.dart';

class LoginRepository {
  final _api = NetworkServicesApi();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
