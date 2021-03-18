import 'package:efarm/widgets/passwordTextFormField.dart';
import 'package:efarm/widgets/phoneNoTextField.dart';
import 'package:efarm/widgets/textFormFieldWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'homepageScreen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _phoneNoController = TextEditingController();
  var _otpController = TextEditingController();

  // var _nameController = TextEditingController();
  // var _passwordController = TextEditingController();
  // var _repPasswordController = TextEditingController();
  // String _phone;
  String _verificationId;

  // _password, _otp, _name, _repeatPassword;
  // bool _obscureText = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _smsController = TextEditingController();
  final SmsAutoFill _autoFill = SmsAutoFill();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.green[900],
                Colors.green[800],
                Colors.green[700],
                Colors.green[600],
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //==================
                //  Title Text
                //==================
                Container(
                  padding: EdgeInsets.only(
                      top: 35.0, left: 12, right: 12, bottom: 16),
                  child: Center(
                    child: Text(
                      'اپنا نیا اکاونٹ بنائیں',
                      style: Theme.of(context).textTheme.headline6,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                //==================
                //  Instructions
                //==================
                Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.topRight,
                  child: Text(
                      'برائے مہربانی نیچے دی گئی تمام معلومات کو ٹھیک طرح سے پُر کریں',
                      style: Theme.of(context).textTheme.bodyText2),
                ),
                Row(
                  children: [
                    InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () {
                        verifyPhoneNo();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.0),
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height * 0.08,
                        padding: EdgeInsets.all(20),
                        color: Colors.orange[800],
                        child: Center(
                          child: Text(
                            'کوڈ بھیجیں',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PhoneNoTextFieldWidget(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        controller: _phoneNoController,
                        labelText: 'موبائل نمبر',
                        hintText: 'اپنا موبائل نمبر درج کریں',
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'برائے مہربانی موبائل نمبر درج کریں';
                          }
                          if (val.length < 10) {
                            return 'آپکا درج کردہ موبائل نمبر درست نہ ہے';
                          } else {
                            return null;
                          }
                        },
                        // onChanged: (value) {
                        //   setState(() {
                        //     _phone = value;
                        //   });
                        // },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 6,
                  ),
                  child: TextFormFieldWidget(
                    prefixIcon: Icon(
                      Icons.keyboard,
                      color: Colors.white,
                    ),
                    controller: _otpController,
                    labelText: 'کوڈ',
                    hintText: 'کوڈ درج کریں',
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'برائے مہربانی کوڈ درج کریں';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                         _smsController.text = value;
                      });
                    },
                  ),
                ),
                // TextFormFieldWidget(
                //   labelText: 'نام درج کریں',
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'نام درست لکھیں';
                //     }
                //     return null;
                //   },
                //   onChanged: (val) {
                //     setState(() {
                //       _phone = val;
                //     });
                //   },
                //   prefixIcon: Icon(
                //     Icons.person_outlined,
                //     color: Colors.white,
                //   ),
                //   controller: _nameController,
                //   hintText: 'اپنا مکمل نام درج کریں',
                // ),
                // ======================
                // Password Text Field
                // ======================
                // PasswordTextFormField(
                //   obscureText: _obscureText,
                //   hintText: '**********',
                //   labelText: 'پاسورڈ درج کریں',
                //   controller: _passwordController,
                //   prefixIcon: Icon(
                //     Icons.lock_outline,
                //     color: Colors.white,
                //   ),
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'Please enter your password';
                //     }
                //     return null;
                //   },
                //   onChanged: (val) {
                //     setState(
                //           () {
                //         _password = val;
                //       },
                //     );
                //   },
                // ),
                //======================
                // REPEAT PASSWORD
                // ======================
                // PasswordTextFormField(
                //   obscureText: _obscureText,
                //   hintText: 'دوبارہ پاسورڈ درج کریں',
                //   labelText: 'دوبارہ پاسورڈ',
                //   controller: _repPasswordController,
                //   prefixIcon: Icon(
                //     Icons.lock_outline,
                //     color: Colors.white,
                //   ),
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'Please enter your password';
                //     }
                //     return null;
                //   },
                //   onChanged: (val) {
                //     setState(
                //           () {
                //         _repeatPassword = val;
                //       },
                //     );
                //   },
                // ),
                //===============================
                // SPACING
                //======================
                // SizedBox(
                //   height: MediaQuery
                //       .of(context)
                //       .size
                //       .height * 0.1,
                // ),
                // ================================
                // GET CURRENT PHONE NUMBER IN DEVICE
                // ================================
                Container(
                  padding: EdgeInsets.all(16.0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 45),
                    child: Text(
                      'موجودہ موبائل نمبر منتخب کریں',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    color: Colors.orange[800],
                    onPressed: () async {
                      _phoneNoController.text = await _autoFill.hint;
                    },
                  ),
                ),
                //,=================================
                // REGISTER ACCOUNT BUTTON
                //=================================
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    signInWithPhoneNumber();
                    Navigator.of(context).pushReplacementNamed(HomePageScreen.routeName);
                  },
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 45),
                  child: Text(
                    'رجسٹر کریں',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  color: Colors.orange[800],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String verifictaionCode, phoneAuthCredentials;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 10),
      ),
    );
  }

  final _auth = FirebaseAuth.instance;

  verifyPhoneNo() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+92 ${_phoneNoController.text}',
        verificationCompleted: (PhoneAuthCredential credentials) async {
          await FirebaseAuth.instance
              .signInWithCredential(credentials);
          //     .then((value) async {
          //   if (value.user != null) {
          //     print('user logged in successfully');
          //   }
          // });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, [int resendToken]) async{
          setState(() {
            _verificationId = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationId = verificationID;
          });
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      showSnackBar('Failed to verify phone number: ${e.toString()}');
    }
  }

  signInWithPhoneNumber()async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: _smsController.text);
      final User user = (await _auth.signInWithCredential(credential)).user;
      showSnackBar('Successfully signed in UID: ${user.uid}');
    } catch (e) {
      showSnackBar('Failed to verify phone number: ${e.toString()}');
      print(e.toString());
    }
  }
}
