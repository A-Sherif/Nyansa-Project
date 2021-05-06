import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String labelText;
  final Icon icon, suffixIcon;
  final String hintText;
  final bool autofocus;
  final Function validate;
  final bool hide;

  const FormInput({
    Key key,
    this.hintText,
    this.icon,
    this.labelText,
    this.autofocus,
    this.validate,
    this.hide,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: icon,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      autofocus: autofocus,
      validator: validate,
      obscureText: hide,
    );
  }
}
