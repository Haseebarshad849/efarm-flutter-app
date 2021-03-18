import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function onChanged;
  final Function validator;
  final Icon prefixIcon;
  final TextEditingController controller;
  bool obscureText;

  PasswordTextFormField({
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.controller,
    this.obscureText,
  });

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  void toggle_visibility() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.white,fontFamily: 'JameelNooriNastalerq'),
          errorStyle: TextStyle(
            color: Colors.red[500],
            fontSize: 15.0,
              fontFamily: 'JameelNooriNastalerq'
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
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white54,fontFamily: 'JameelNooriNastalerq'),
          prefixIcon: widget.prefixIcon,
          suffixIcon: Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 30),
            child: IconButton(
              onPressed: toggle_visibility,
              icon: widget.obscureText
                  ? Icon(
                      Icons.visibility,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
