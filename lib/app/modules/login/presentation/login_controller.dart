import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/login_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/core/stores/auth_store.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthStore authStore;
  final LoginWithEmail loginWithEmailUseCase;

  _LoginControllerBase(
    this.authStore,
    this.loginWithEmailUseCase,
  );

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

  @computed 
  LoginValidator get loginValidator => LoginValidator.withData(email: email, password: password,);

  Future enterLogin() async{
    var result = await loginWithEmailUseCase(loginValidator);
    result.fold((failure){
      asuka.showDialog(builder: (context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(failure.message),
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
    },(user){
      authStore.setUser(user);
      Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
    });

  }

  Future enterRegister() async {
    Modular.to.pushNamedAndRemoveUntil('/register', (_) => false);
  }

}
