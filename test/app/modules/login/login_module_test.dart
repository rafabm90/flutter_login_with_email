import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_page/app/app_module.dart';
import 'package:flutter_login_page/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter_login_page/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mock-firebase.dart';

main() async {

  initModules([
    AppModule(),
    LoginModule(),
  ]);

  setUpAll(() async {
    setupCloudFirestoreMocks();
    await Firebase.initializeApp();
  });

  test("should get usecase LoginWithEmail", () {
    final usecase = Modular.get<LoginWithEmail>();
    expect(usecase, isA<LoginWithEmailImpl>());
  });

}
