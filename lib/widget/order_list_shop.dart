import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/model/user_model.dart';
import 'package:food/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderListShop extends StatefulWidget {
  @override
  _OrderListShopState createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {

  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Text(
      'แสดงรายการอาหารที่ลูกค้าสั่ง'
    );
  }
}