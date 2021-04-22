import 'package:meta/meta.dart';

import 'package:flutter_login_page/app/modules/login/domain/entities/logged_user.dart';
import 'package:flutter_login_page/app/modules/login/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({
    @required String name,
    @required String email,
    @required String uid,
    @required String photoURL,
  }) : super(name: name, email: email, uid: uid, photoURL: photoURL);
}
