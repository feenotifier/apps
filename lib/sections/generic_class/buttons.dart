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
  final IconData suffixIconData;
  final Color suffixIconColor;
  final double suffixIconSize;

  const GenericButtons({
    Key key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.buttonType = ButtonType.filled,
    this.suffixIconData,
    this.suffixIconColor,
    this.suffixIconSize,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
            SizedBox(
              width: Distance_Unit * 2,
            ),
            if (suffixIconData != null)
              Icon(
                suffixIconData,
                color: suffixIconColor ?? Colors.white,
                size: suffixIconSize ?? 20,
              )
          ],
        ),
      ),
    );
  }
}
