import 'package:apps/sections/constant/constants.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  filled,
  outlined,
}

class GenericButtons extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Function onTap;
  final ButtonType buttonType;
  const GenericButtons({
    Key key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.buttonType = ButtonType.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Distance_Unit * 14,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          Distance_Unit * 4,
        ),
        border: buttonType == ButtonType.outlined
            ? Border.all(
                color: Color(0xFFFD6F96),
              )
            : null,

      ),
      child: TextButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          )),
    );
  }
}
