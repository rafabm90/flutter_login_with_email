import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:flutter_login_page/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

//part 'get_logged_user.g.dart';



abstract class GetLoggedUser{
  Future<Either<Failure,LoggedUserInfo>> call();
}

@Injectable(singleton: false)
class GetLoggedUserImpl implements GetLoggedUser{
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();  
  }
  
}