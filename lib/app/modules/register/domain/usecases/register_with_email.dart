import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/core/errors/messages.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/errors.dart';

import 'package:flutter_login_page/app/modules/register/domain/entities/register_validator.dart';
import 'package:flutter_login_page/app/modules/register/infra/repositories/register_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'register_with_email.g.dart';

abstract class RegisterWithEmail {
  Future<Either<Failure, User>> call(RegisterValidator registerValidator);
}

@Injectable(singleton: false)
class RegisterWithEmailImpl implements RegisterWithEmail {
  final RegisterRepository repository;

  RegisterWithEmailImpl(this.repository);

  @override
  Future<Either<Failure, User>> call(
      RegisterValidator registerValidator) async {
    if (!registerValidator.isValidEmail) {
      return Left(ErrorRegister(message: Messages.INVALID_EMAIL));
    }

    if (!registerValidator.isValidPassword) {
      return Left(ErrorRegister(message: Messages.INVALID_PASSWORD));
    }

    if (!registerValidator.isValidName) {
      return Left(ErrorRegister(message: Messages.INVALID_NAME));
    }

    return await repository.registerWithEmail(
      email: registerValidator.email,
      password: registerValidator.password,
      name: registerValidator.name,
    );
  }
}
