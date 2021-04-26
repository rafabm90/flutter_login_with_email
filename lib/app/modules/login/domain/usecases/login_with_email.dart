import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/core/errors/messages.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/login_validator.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, User>> call(LoginValidator loginValidator);
}

@Injectable(singleton: false)
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;

  LoginWithEmailImpl(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginValidator loginValidator) async {

    if(!loginValidator.isValidEmail){
      return Left(ErrorLogin(message: Messages.INVALID_EMAIL));
    }
    if(!loginValidator.isValidPassword){
      return Left(ErrorLogin(message: Messages.INVALID_CREDENTIALS));
    }
    return await repository.loginWithEmail(
      email: loginValidator.email,
      password: loginValidator.password,
    );
  }
}
