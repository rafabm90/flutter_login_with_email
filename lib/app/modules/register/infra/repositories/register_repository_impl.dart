import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/core/errors/messages.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_login_page/app/modules/register/presentation/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'register_repository_impl.g.dart';

abstract class RegisterRepository {
  Future<Either<Failure, User>> registerWithEmail({String name, String email, String password});
}

@Injectable(singleton: false)
class RegisterRepositoryImpl implements RegisterRepository {
  final FirebaseAuth auth;
  final RegisterController controller;

  RegisterRepositoryImpl(this.auth, this.controller);

  Future<Either<Failure, User>> registerWithEmail(
      {String name, String email, String password}) async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    
    //userCredential.user.displayName = controller.setName(name);
      
      return Right(userCredential?.user);
    } catch (e) {
      return Left(ErrorRegister(message: Messages.FAILED_TO_REGISTER));
    }
  }
}
