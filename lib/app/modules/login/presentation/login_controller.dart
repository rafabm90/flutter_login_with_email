import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:flutter_login_page/app/modules/home/presentation/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthStore auth;
  _LoginControllerBase(this.auth);

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  void setPassword(String value) => password = value;

  @observable
  String currentMessage = '';
  @action
  void setCurrentMessage(String value) => currentMessage = value;

  Future enterLogin() async {
    try {
      await auth.loginWithEmail(email, password);

      if (auth.userCredential != null) {
        Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
      }
    } on FirebaseAuthException catch (e) {
      setCurrentMessage("Credenciais Inválidas.");
      asuka.showDialog(builder: (context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text('Login e/ou Senha inválido(s).'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
    }
  }
}
