import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_login_page/app/modules/login/presentation/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBox extends StatefulWidget {
  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends ModularState<StatefulWidget, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 30, left: 29),
      decoration: BoxDecoration(
        color: AppTheme.boxColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
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
          Row(
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
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final bool obscureText;

  final String text;

  final Function onChanged;

  final Icon iconBox;

  const CustomText(
      {Key key, this.obscureText, this.text, this.onChanged, this.iconBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: iconBox,
        hintText: text,
        contentPadding: EdgeInsets.only(top: 5, left: 5, bottom: 1),
        isDense: true,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color(0xff717171),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
