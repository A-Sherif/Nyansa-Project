import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final Function validate;
  const PasswordFormField({
    Key key,
    this.validate,
  }) : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  void _visible() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

<<<<<<< HEAD
  // String passwordStruct(String value) {
  //   String pattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\/$&*=-]).{6,}$';
  //   RegExp regex = new RegExp(pattern);
  //   if (value.isEmpty) {
  //     return 'Enter a password';
  //   } else if (!regex.hasMatch(value)) {
  //     return 'Password should contain at least one uppercase letter and symbol';
  //   }
  //   return null;
  // }

=======
>>>>>>> c8e7fd060f19ca8158ccd4ae4df735a9ea144a78
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Password',
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              _visible();
            },
          ),
        ),
        obscureText: _obscureText,
        validator: widget.validate,
      ),
    );
  }
}
