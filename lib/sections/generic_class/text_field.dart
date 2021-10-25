import 'package:apps/sections/constant/constants.dart';
import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final IconData prefixIconName;
  final double borderRadius;
  final Color borderColor;
  final Color focusBorderColor;
  final Color prefixIconColor;
  final Color labelTextColor;
  final Function onChanged;
  final Function onSubmitted;
  final Color textColor;
  const GenericTextField({
    Key key,
    this.keyboardType,
    this.labelText,
    this.prefixIconName,
    this.borderRadius,
    this.borderColor,
    this.focusBorderColor,
    this.prefixIconColor,
    this.labelTextColor,
    this.onChanged,
    this.onSubmitted,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: TextStyle(
        color: textColor,
      ),
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        fillColor: textColor,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelTextColor,
        ),
        alignLabelWithHint: false,
        prefixIcon: Icon(
          prefixIconName,
          color: prefixIconColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? Distance_Unit * 3,
          ),
          borderSide: BorderSide(
            color: borderColor ?? Colors.black,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? Distance_Unit * 3,
          ),
          borderSide: BorderSide(
            color: focusBorderColor ?? Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
