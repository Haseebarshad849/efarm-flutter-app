import 'package:flutter/cupertino.dart';

class PersonModel{
  final String phoneNo;
  final String uid;
  final String name;
  final bool isAdmin;

  PersonModel({
   @required this.phoneNo,
   @required this.uid,
   this.name='E-farm User',
   this.isAdmin = false
  });


PeronModelMap(){
  var mapy = Map<String,dynamic>();
  mapy['phoneNo']= phoneNo;
  mapy['uid']=uid;
  mapy['name']=name;
  mapy['admin']=isAdmin;
}
}