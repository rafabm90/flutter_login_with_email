import 'package:flutter_login_page/app/modules/home/presentation/home_controller.dart';
import 'package:flutter_login_page/app/modules/home/presentation/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => HomePage()),
      ];
}
