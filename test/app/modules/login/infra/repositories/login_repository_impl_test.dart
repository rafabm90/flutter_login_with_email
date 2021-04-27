import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_page/app/core/errors/messages.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/logout.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class FireBaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

main() {

  final auth = FireBaseAuthMock();
  final repository = LoginRepositoryImpl(auth);
  final userCredential = UserCredentialMock();
  final userReturn = UserMock();


    group("login with email", (){
      test("should call ErrorLogin", () async {
        var result = await repository.loginWithEmail(email: "teste@teste.com",password: "teste123456");
        expect(result.leftMap((l) => l is ErrorLogin), Left(true));
        expect(result.fold((l) => l.message, id), Messages.FAILED_TO_LOGIN);
      });

      test("should get user", () async {
        when(auth.signInWithEmailAndPassword(email: "teste@teste.com", password: "teste123456")).thenAnswer((_) async => userCredential);
        when(userCredential.user).thenReturn(userReturn);
        when(userReturn.email).thenReturn("teste@teste.com");
        when(userReturn.uid).thenReturn("teste");
        var result = await repository.loginWithEmail(email: "teste@teste.com",password: "teste123456");
        expect(result, isA<Right<dynamic, User>>());
        expect(result.fold(id, (user) => user.email), "teste@teste.com");
      });

      test("should call ErrorLogin catch", () async {
        when(auth.signInWithEmailAndPassword(email: "teste@teste.com", password: "teste123456")).thenThrow(Exception());
        var result = await repository.loginWithEmail(email: "teste@teste.com",password: "teste123456");
        expect(result.leftMap((l) => l is ErrorLogin), Left(true));
        expect(result.fold((l) => l.message, id), Messages.FAILED_TO_LOGIN);
      });
    });
}
