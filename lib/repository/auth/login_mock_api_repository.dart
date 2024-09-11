import 'package:flutter_bloc_clean_architecture_masterclass/model/user/user_model.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {'token': 'dff3rdfdfdfdf'};
    return UserModel.fromJson(response);
  }
}
