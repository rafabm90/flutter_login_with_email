

import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/core/errors/erros.dart';
import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/login_validator.dart';
import 'package:flutter_login_page/app/modules/register/domain/entities/register_validator.dart';
import 'package:flutter_login_page/app/modules/register/domain/usecases/register_with_email.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store{
  final RegisterWithEmail registerWithEmailUseCase;

  _RegisterControllerBase(this.registerWithEmailUseCase);

  @observable
  String name;
  @action
  void setName(String value) => name = value; 

  @observable
  String email;
  @action
  void setEmail(String value) => email = value; 

  @observable
  String password;
  @action
  void setPassword(String value) => password = value; 

  @computed 
  RegisterValidator get registerValidator => RegisterValidator.withData(email: email, password: password, name: name);

  Future register() async {
    var result = await registerWithEmailUseCase(registerValidator);
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
      Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
    }
    );
  }
}
