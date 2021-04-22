import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_controller.dart';
import 'package:flutter_login_page/app/modules/login/presentation/widgets/image_bot.dart';
import 'package:flutter_login_page/app/modules/login/presentation/widgets/image_top.dart';
import 'package:flutter_login_page/app/modules/login/presentation/widgets/login_box.dart';
import 'package:flutter_login_page/app/modules/login/presentation/widgets/main_button.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<StatefulWidget, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
          Expanded(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ImageForm1(),
                      LoginBox(),
                      MainButton(
                        onPressed: controller.enterLogin,
                        text: "Entrar",
                        buttonColor: AppTheme.loginButtonColor,
                      ),
                      ImageForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
