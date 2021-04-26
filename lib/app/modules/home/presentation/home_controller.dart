import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String uid;
  @action
  void setUid(String value) => uid = value;

  @observable
  String nameUser;
  @action
  void setNameUser(String value) => nameUser = value;

  @observable
  String urlImage;
  @action
  void setUrlImage(String value) => urlImage = value;

}
