

import 'package:flutter_login_page/app/modules/login/infra/models/user_model.dart';

abstract class LoginDataSource{
  Future<UserModel> currentUser();
  Future<void> logout(); 
}