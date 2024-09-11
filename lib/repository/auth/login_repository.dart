import 'package:flutter_bloc_clean_architecture_masterclass/model/user/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginApi(dynamic data);
}
