import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';


abstract class LoginRepository{
  Future<Either<Failure,LoggedUserInfo>> loggedUser();

   Future<Either<Failure, Unit>> logout();
}