import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/errors/messages.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/login_validator.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class LoginRepositoryMock extends Mock implements LoginRepository {}

class FirebaseUserMock extends Mock implements User {}

main() {
  final repository = LoginRepositoryMock();
  final usecase = LoginWithEmailImpl(repository);

  test('should returned is invalid email', () async {
    final user = FirebaseUserMock(); 
    final loginValidator = LoginValidator.withData(email: 'teste', password: "");
    when(repository.loginWithEmail(email: "",password: ""))
        .thenAnswer((_) async => Right(user));
    final result = await usecase(loginValidator);

    expect(result.leftMap((l) => l is ErrorLogin), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_EMAIL);

  });

    test('should returned is credentials invalid', () async {
    final user = FirebaseUserMock(); 
    final loginValidator = LoginValidator.withData(email: 'teste@teste.com', password: "");
    when(repository.loginWithEmail(email: "",password: ""))
        .thenAnswer((_) async => Right(user));
    final result = await usecase(loginValidator);

    expect(result.leftMap((l) => l is ErrorLogin), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_CREDENTIALS);

  });

  test('should consume repository', () async {
    final user = FirebaseUserMock(); 
    final loginValidator = LoginValidator.withData(email: 'teste@teste.com', password: "teste12345");
    when(repository.loginWithEmail(email: "teste@teste.com",password: "teste12345"))
        .thenAnswer((_) async => Right(user));
    when(user.email).thenReturn('teste@teste.com');
    when(user.uid).thenReturn('asdasdsdasd');
    final result = await usecase(loginValidator);

    expect(result, Right(user));
    expect(result.fold(id, (user) => user.email), 'teste@teste.com');
    expect(result.fold(id, (user) => user.uid), 'asdasdsdasd');
  });

  

}

