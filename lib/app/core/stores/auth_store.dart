import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  UserCredential userCredential;

  @action
  void setUserCredential(UserCredential value) => userCredential = value;

  Future loginWithEmail(String email, String password) async {
    final userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    setUserCredential(userCredential);
    //await auth.currentUser.updateProfile(displayName: 'Rafael');
    //await auth.currentUser.updateProfile(displayName: 'Joao');
    await auth.currentUser.updateProfile(
        photoURL: 'https://avatars.githubusercontent.com/u/70381610?v=4');
  }

  Future signOut() async {
    setUserCredential(null);
    await auth.signOut();
    Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
  }
}
