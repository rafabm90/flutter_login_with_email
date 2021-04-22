import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/logout.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_controller.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i<AuthStore>())),
        Bind((i) => GetLoggedUserImpl(i())),
        Bind((i) => LogoutImpl(i())),
        Bind((i) => LoginRepositoryImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginPage()),
      ];
}
