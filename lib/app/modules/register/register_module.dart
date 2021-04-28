
import 'package:flutter_login_page/app/modules/register/domain/usecases/register_with_email.dart';
import 'package:flutter_login_page/app/modules/register/infra/repositories/register_repository_impl.dart';
import 'package:flutter_login_page/app/modules/register/presentation/register_controller.dart';
import 'package:flutter_login_page/app/modules/register/presentation/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends ChildModule{
  @override
  List<Bind> get binds => [
    $RegisterController,
    $RegisterRepositoryImpl,
    $RegisterWithEmailImpl
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => RegisterPage()),
  ];

}