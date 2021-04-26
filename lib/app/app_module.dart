import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_page/app/app_widget.dart';
import 'package:flutter_login_page/app/core/pages/splash_screen_page.dart';
import 'package:flutter_login_page/app/modules/home/home_module.dart';

import 'package:flutter_login_page/app/modules/login/login_module.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_login_page/app/core/stores/auth_store.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        ...LoginModule.export,
        $AuthStore,
        Bind((i) => FirebaseAuth.instance),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SplashScreenPage()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
