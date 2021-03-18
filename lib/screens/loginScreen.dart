import 'package:efarm/screens/forgetPassword.dart';
import 'package:efarm/screens/signupScreen.dart';
import 'package:efarm/widgets/passwordTextFormField.dart';
import 'package:efarm/widgets/phoneNoTextField.dart';
import 'package:efarm/widgets/textFormFieldWidget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // static const routeName = '/';

  String _phone, _password;
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // color: Colors.black,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.green[400], BlendMode.multiply),
                  image: AssetImage(
                    'assets/background/sheep.jpg',
                  ),
                ),
              ),
            ),
            Positioned(
                child: Column(
              children: [
                // ===================
                // Title at the top
                // ===================
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 40.0,
                    ),
                    child: Text(
                      'ہمارا مقصد آسانیاں پیدا کرنا',
                      style: Theme.of(context).textTheme.headline6,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: Image.asset(
                    'assets/icons/efarm_logo.png',
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // ======================
                      // Phone Text Field
                      // ======================
                      PhoneNoTextFieldWidget(
                        labelText: 'Phone No',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp("^[3]+[0-9]").hasMatch(value)) {
                            return 'Phone number must start from 3';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            _phone = val;
                          });
                        },
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        controller: _phoneController,
                        hintText: '3xxxxxxxxxx',
                      ),
                      // ======================
                      // Password Text Field
                      // ======================
                      PasswordTextFormField(
                        obscureText: _obscureText,
                        hintText: '**********',
                        labelText: 'Password',
                        controller: _passwordController,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(
                            () {
                              _password = val;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // ======================================
                      // Raised Button for Validation and login
                      // ======================================
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.08,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: BorderSide(color: Colors.green, width: 3),
                          ),
                          child: Icon(Icons.arrow_forward_ios_outlined),
                          color: Colors.white,
                          splashColor: Colors.green,
                          onPressed: () => submitButton(),
                        ),
                      ),
                      // Spacing
                      SizedBox(
                        height: 20.0,
                      ),
                      // ======================================
                      //          Forget Password
                      // ======================================
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ForgetPasswordScreen.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Forget password?'),
                        ),
                      ),
                      // ======================================
                      //        Create Account Sign Up
                      // ======================================
                      InkWell(
                        onTap: () {
                          //...
                          Navigator.of(context)
                              .pushNamed(SignupScreen.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Dont Have an account? \"Create new\"'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  submitButton() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_phone);
      print(_password);
    }
  }
}
