import 'package:flutter/material.dart';

class ImageForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          SizedBox(),
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
              right: 22.0,
            ),
            child: Transform.translate(
              offset: Offset(0, 120),
              child: Image.asset(
                "assets/images/paisagem.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
