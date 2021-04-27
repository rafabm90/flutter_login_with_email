import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';
import 'package:flutter_login_page/app/core/widgets/form_box.dart';
import 'package:flutter_login_page/app/core/widgets/image_bot.dart';
import 'package:flutter_login_page/app/core/widgets/image_top.dart';
import 'package:flutter_login_page/app/core/widgets/main_button.dart';
import 'package:flutter_login_page/app/modules/register/presentation/register_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<StatefulWidget, RegisterController> {
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
                        SizedBox(height: 30),
                        Text(
                          "Cadastro",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        FormBox(
                          child: formRegister(),
                        ),
                        MainButton(
                          onPressed: null,
                          text: "Proximo",
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

  Widget formRegister() {
    return Container(
      padding: EdgeInsets.only(bottom: 10,right: 10),
      child: Column(
        children: <Widget>[
          CustomText(
            obscureText: false,
            text: 'Nome',
            onChanged: null,
            iconBox: Icon(Icons.person, size: 16),
          ),
          CustomText(
            obscureText: false,
            text: 'E-mail',
            onChanged: null,
            iconBox: Icon(Icons.email, size: 16),
          ),
          CustomText(
            obscureText: true,
            text: 'Senha',
            onChanged: null,
            iconBox: Icon(Icons.lock, size: 16),
          ),
        ],
      ),
    );
  }
}
