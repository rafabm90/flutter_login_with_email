


import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:flutter_login_page/app/modules/login/domain/errors/erros.dart';
import 'package:flutter_login_page/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/datasource/login_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';

//part 'login_repository_impl.g.dart';

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository{
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try{
      var user = await dataSource.currentUser();
      return Right(user);
    }catch(e){
      return Left(ErrorGetLoggedUser(e));
    }
    
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try{
      await dataSource.logout();
      return Right(unit);
    }catch(e){
      return Left(ErrorLogout(e));
    }
   
  }
}