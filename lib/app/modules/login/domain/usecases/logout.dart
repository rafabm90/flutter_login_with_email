
import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'logout.g.dart';


abstract class Logout{
  Future<Either<Failure,Unit>> call();

}

@Injectable(singleton: false)
class LogoutImpl implements Logout{
  final LoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async{
    return await repository.logout();
  }
}