import 'package:string_validator/string_validator.dart' as validator;
import 'package:flutter/material.dart';

class RegisterValidator {
  String email;
  String password;
  String name;

  bool get isValidEmail => validator.isEmail(email ?? "");
  bool get isValidPassword =>
      password != null && password.isNotEmpty && password.length >= 7;
  bool get isValidName => name != null && name.length >= 3;

  RegisterValidator._({
    this.email,
    this.password,
    this.name,
  });

  factory RegisterValidator.withData({
    @required String email,
    @required String password,
    @required String name,
  }) {
    return RegisterValidator._(
      email: email,
      password: password,
      name: name,
    );
  }
}
