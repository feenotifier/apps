import 'package:flutter/material.dart';

class GenericButtons extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Function onTap;
  const GenericButtons({
    Key key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
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
