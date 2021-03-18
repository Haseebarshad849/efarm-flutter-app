import 'package:flutter/material.dart';

class NewAdsScreen extends StatefulWidget {
  @override
  _NewAdsScreenState createState() => _NewAdsScreenState();
}

class _NewAdsScreenState extends State<NewAdsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.37,
              // color: Theme.of(context).primaryColor,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/profile_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              // child: ,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Container(
                  color: Colors.white54,
                  child: Center(
                    child: Text(
                      'Fill Animal Details Carefully',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        'Sale Type',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.green[400],fontWeight: FontWeight.bold),
                      ),
                      _radioButton(
                        title: 'General',
                        onChanged: (val) {
                          setState(() {
                            _groupValue = val;
                            print(_groupValue);
                          });
                        },
                        value: 'general',
                      ),
                      _radioButton(
                        title: 'Bidding',
                        onChanged: (val) {
                          setState(() {
                            _groupValue = val;
                            print(_groupValue);
                          });
                        },
                        value: 'bidding',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        'Gender',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.green[400],fontWeight: FontWeight.bold),
                      ),
                      _radioButton(
                        title: 'Male',
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                            print(_groupValue);
                          });
                        },
                        value: 'male',
                      ),
                      _radioButton(
                        title: 'Female',
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                            print(_groupValue);
                          });
                        },
                        value: 'female',
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

String _groupValue = '';

Widget _radioButton({String title, String value, Function onChanged}) {
  return RadioListTile(
    value: value,
    groupValue: _groupValue,
    onChanged: onChanged,
    title: Text(title),
    activeColor: Colors.green,
  );
}
