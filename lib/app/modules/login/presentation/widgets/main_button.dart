import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainButton extends StatelessWidget {
  final Function onPressed;

  final String text;

  final Color buttonColor;

  const MainButton({Key key, this.onPressed, this.text, this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 42,
      margin: EdgeInsets.only(bottom: 0, top: 53),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
