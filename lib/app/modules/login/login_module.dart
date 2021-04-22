import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_controller.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i<AuthStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginPage()),
      ];
}
