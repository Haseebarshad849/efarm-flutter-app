import 'package:flutter/material.dart';

class PhoneNoTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function onChanged;
  final Function validator;
  final Icon prefixIcon;
  final TextEditingController controller;

  PhoneNoTextFieldWidget({
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        maxLength: 10,
        decoration: InputDecoration(
          prefix: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('+92'),

          ),
          prefixStyle: TextStyle(color: Colors.white),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white,fontFamily: 'JameelNooriNastalerq'),
          errorStyle: TextStyle(
            color: Colors.red[500],
            fontFamily: 'JameelNooriNastalerq',
            fontSize: 15.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.white38,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54,fontFamily: 'JameelNooriNastalerq'),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
