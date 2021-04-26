import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'get_logged_user.g.dart';



abstract class GetLoggedUser{
  Future<Either<Failure,User>> call();
}

@Injectable(singleton: false)
class GetLoggedUserImpl implements GetLoggedUser{
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, User>> call() async {
    return await repository.loggedUser();  
  }
  
}