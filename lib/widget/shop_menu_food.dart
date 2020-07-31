import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/model/food_model.dart';
import 'package:food/model/user_model.dart';
import 'package:food/utility/my_constant.dart';
import 'package:food/utility/my_style.dart';

class ShowMenuFood extends StatefulWidget {
  final UserModel userModel;
  ShowMenuFood({Key key, this.userModel}) : super(key: key);
  @override
  _ShowMenuFoodState createState() => _ShowMenuFoodState();
}

class _ShowMenuFoodState extends State<ShowMenuFood> {
  UserModel userModel;
  String idShop;
  List<FoodModel> foodModels = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readFoodMenu();
  }

  Future<Null> readFoodMenu() async {
    idShop = userModel.id;
    String url =
        '${MyConstant().domain}/nalinfood/getFoodWhereIdShop.php?isAdd=true&idShop=$idShop';
    Response response = await Dio().get(url);
    print('res ==>> $response');
    var result = json.decode(response.data);
    print('result = $result');
    for (var map in result) {
      FoodModel foodModel = FoodModel.fromJson(map);
      setState(() {
        foodModels.add(foodModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return foodModels.length == 0
        ? MyStyle().showProgress()
        : ListView.builder(
            itemCount: foodModels.length,
            itemBuilder: (context, index) => Row(
              children: <Widget>[
                showFoodImage(context, index),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: <Widget>[
                      Text(foodModels[index].nameFood),
                      Text(foodModels[index].price),
                      Text(foodModels[index].detail),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Container showFoodImage(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      width: MediaQuery.of(context).size.width * 0.5 - 16.0,
      height: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: NetworkImage(
              '${MyConstant().domain}${foodModels[index].pathImage}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
