// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$userCredentialAtom = Atom(name: '_AuthStoreBase.userCredential');

  @override
  UserCredential get userCredential {
    _$userCredentialAtom.reportRead();
    return super.userCredential;
  }

  @override
  set userCredential(UserCredential value) {
    _$userCredentialAtom.reportWrite(value, super.userCredential, () {
      super.userCredential = value;
    });
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void setUserCredential(UserCredential value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setUserCredential');
    try {
      return super.setUserCredential(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userCredential: ${userCredential}
    ''';
  }
}
