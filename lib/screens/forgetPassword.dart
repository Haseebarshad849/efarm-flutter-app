import 'package:efarm/widgets/passwordTextFormField.dart';
import 'package:efarm/widgets/textFormFieldWidget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/forgetPasswordScreen';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String _phone, _password, _otp, _repeatPassword;
  var _phoneNoController = TextEditingController();
  var _otpController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repPasswordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //==================
            //  Title Text
            //==================
            Container(
              padding:
                  EdgeInsets.only(top: 35.0, left: 12, right: 12, bottom: 16),
              child: Center(
                child: Text(
                  ' موبائل نمبر لکھیں ',
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
                  'برائے مہربانی اپنا پہلے سے رجسٹر شدہ موبائل نمبر درج کریں',
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            Row(
              children: [
                InkWell(
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {
                    // print('code sent');
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
                  child: TextFormFieldWidget(
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
                    onChanged: (value) {
                      setState(() {
                        _phone = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'آپ کے موبائل نمبر پر کوڈ بذریعہ مسیج بھیجا گیا ہے اسے یہاں درج کریں',
                          style: TextStyle().copyWith(color: Colors.black87),textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                        return 'برائے مہربانی درست کوڈ درج کریں';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _otp = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            PasswordTextFormField(
              obscureText: _obscureText,
              hintText: '**********',
              labelText: 'نیا پاسورڈ درج کریں',
              controller: _passwordController,
              prefixIcon: Icon(
                Icons.lock_outline,
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
            //======================
            // REPEAT PASSWORD
            // ======================
            PasswordTextFormField(
              obscureText: _obscureText,
              hintText: 'دوبارہ پاسورڈ درج کریں',
              labelText: 'دوبارہ پاسورڈ',
              controller: _repPasswordController,
              prefixIcon: Icon(
                Icons.lock_outline,
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
                    _repeatPassword = val;
                  },
                );
              },
            ),
            //===============================
            // SPACING
            //======================
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            //=================================
            // REGISTER ACCOUNT BUTTON
            //=================================
            RaisedButton(
              onPressed: () {
                //.....
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
    );
  }
}
