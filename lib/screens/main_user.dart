import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/model/user_model.dart';
import 'package:food/utility/my_constant.dart';
import 'package:food/utility/my_style.dart';
import 'package:food/utility/signout_process.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;
  List<UserModel> userModels = List();
  List<Widget> shopCards = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
    readShop();
  }

  Future<Null> readShop() async {
    String url =
        '${MyConstant().domain}/nalinfood/getUserWhereChooseType.php?isAdd=true&ChooseType=Shop';
    await Dio().get(url).then((value) {
      // print('value ==>> $value');
      var result = json.decode(value.data);
      for (var map in result) {
        UserModel model = UserModel.fromJson(map);

        String nameShop = model.nameShop;
        if (nameShop.isNotEmpty) {
          print('NameShop==>> ${model.nameShop}');
          setState(() {
            userModels.add(model);
            shopCards.add(createCard(model));
          });
        }
      }
    });
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : '$nameUser login'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: shopCards.length == 0
          ? MyStyle().showProgress()
          : GridView.extent(
              maxCrossAxisExtent: 280.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: shopCards,
            ),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
          ],
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('user.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'Name Login',
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().darkColor),
      ),
    );
  }

  Widget createCard(UserModel userModel) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('${MyConstant().domain}${userModel.urlPicture}'),
            ),
          ),
          MyStyle().mySizebox(),
          MyStyle().showTitleH3(userModel.nameShop),
        ],
      ),
    );
  }
}
