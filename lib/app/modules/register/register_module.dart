
import 'package:flutter_login_page/app/modules/register/presentation/register_controller.dart';
import 'package:flutter_login_page/app/modules/register/presentation/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends ChildModule{
  @override
  List<Bind> get binds => [
    $RegisterController,
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => RegisterPage()),
  ];

}