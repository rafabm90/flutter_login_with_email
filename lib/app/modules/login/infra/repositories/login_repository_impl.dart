import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/core/errors/messages.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_repository_impl.g.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> loggedUser();

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, User>> loginWithEmail({String email, String password});
}

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth auth;

  LoginRepositoryImpl(this.auth);

  @override
  Future<Either<Failure, User>> loggedUser() async {
    try {
      var user = await auth.currentUser;
      if (user == null) {
        return Left(ErrorGetLoggedUser(
            message: Messages.FAILED_TO_RECOVER_USER_LOGGED));
      }
      return Right(user);
    } catch (e) {
      return Left(
          ErrorGetLoggedUser(message: Messages.FAILED_TO_RECOVER_USER_LOGGED));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await auth.signOut();
      return Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: Messages.FAILED_TO_LOGOUT));
    }
  }

  Future<Either<Failure, User>> loginWithEmail(
      {String email, String password}) async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential == null) {
        return Left(ErrorLogin(message: Messages.FAILED_TO_LOGIN));
      }
      return Right(userCredential?.user);
    } catch (e) {
      return Left(ErrorLogin(message: Messages.FAILED_TO_LOGIN));
    }
  }
}
