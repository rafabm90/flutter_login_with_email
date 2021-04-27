import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';
import 'package:flutter_login_page/app/core/widgets/form_box.dart';
import 'package:flutter_login_page/app/core/widgets/image_bot.dart';
import 'package:flutter_login_page/app/core/widgets/image_top.dart';
import 'package:flutter_login_page/app/core/widgets/main_button.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Expanded(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ImageForm1(),
                      FormBox(child: formLogin(),),
                      MainButton(
                        onPressed: controller.enterLogin,
                        text: "Entrar",
                        buttonColor: AppTheme.loginButtonColor,
                      ),
                      MainButton(
                        onPressed: controller.enterRegister,
                        text: "Cadastrar",
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
  
  Widget formLogin(){ 
  return Column(
        children: <Widget>[
          CustomText(
            obscureText: false,
            text: 'E-mail',
            onChanged: controller.setEmail,
            iconBox: Icon(Icons.person, size: 16),
          ),
          CustomText(
            obscureText: true,
            text: 'Senha',
            onChanged: controller.setPassword,
            iconBox: Icon(Icons.lock, size: 16),
          ),
          Observer(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      controller.currentMessage,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppTheme.adviceColor,
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ],
      );
  }

}