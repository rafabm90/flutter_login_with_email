import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/logout.dart';
import 'package:flutter_login_page/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_controller.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $LogoutImpl,
    $LoginRepositoryImpl,
    $LoginController,
  ];

  List<Bind> get binds => [
        $LoginWithEmailImpl,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginPage()),
      ];
}
