import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login_page/app/app_theme.dart';

class ImageForm1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/computador.png',
              color: AppTheme.appBlack,
              height: 160,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Image.asset(
              'assets/images/computador.png',
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
