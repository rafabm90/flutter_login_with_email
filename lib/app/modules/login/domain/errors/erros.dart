


import 'package:flutter_login_page/app/core/errors/erros.dart';

class ErrorGetLoggedUser extends Failure{
  final String message;

  ErrorGetLoggedUser(this.message);

}

class ErrorLogout extends Failure{
  final String message;

  ErrorLogout(this.message);
}