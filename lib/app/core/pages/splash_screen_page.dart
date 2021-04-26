import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

splashScreenPage() {
  Future.delayed(Duration(seconds: 3)).whenComplete(() async {
        bool isLogged = await Modular.get<AuthStore>().checkLogin();
          isLogged
            ? Modular.to.pushNamedAndRemoveUntil("/home", (_) => false)
            : Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
      });
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    splashScreenPage();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppTheme.splashScreenPageColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/computador.png'),
            ),
            SizedBox(height: 30),
            SpinKitSquareCircle(
              color: AppTheme.appColor,
            ),
          ],
        ));
  }
}
