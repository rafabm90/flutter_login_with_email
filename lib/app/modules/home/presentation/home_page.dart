import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';
import 'package:flutter_login_page/app/modules/home/presentation/home_controller.dart';
import 'package:flutter_login_page/app/modules/login/presentation/widgets/main_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/app/core/stores/auth_store.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<StatefulWidget, HomeController> {
  final _authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    controller.setUid(_authStore.userCredential.user.uid);
    controller.setNameUser(_authStore.userCredential.user.displayName);
    controller.setUrlImage(_authStore.userCredential.user.photoURL);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.urlImage == null) {
        return Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: AppTheme.homePageColor,
          toolbarHeight: 70,
          title: const Text('Home Page'),
          actions: [],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(controller.urlImage),
                backgroundColor: Colors.black,       
              ),
            ),
            Center(
              child: Text(
                'Welcome ${controller.nameUser}',
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Uid: ${controller.uid}',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),

                ),
              ),
            ),
            Center(
              child: MainButton(
                onPressed: _authStore.signOut,
                text: "Logout",
                buttonColor: AppTheme.homePageColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
