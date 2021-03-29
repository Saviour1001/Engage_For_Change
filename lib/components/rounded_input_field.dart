import 'package:flutter/material.dart';
import 'package:day12_login/components/text_field_container.dart';
import 'package:day12_login/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      // child: new Form(
      // key: formkey1,
      child: TextFormField(
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),

      // )
    );
  }
}
