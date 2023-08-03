import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final btnColor;
  final textColor;
  final String? btnText;
  final buttonTapped;

  CalButton({this.btnColor, this.btnText, this.textColor, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
            // borderRadius: BorderRadius.circular(20),
            child: Container(
          color: btnColor,
          child: Center(
            child: Text(
              btnText!,
              style: TextStyle(color: textColor),
            ),
          ),
        )),
        onTap: buttonTapped);
  }
}
