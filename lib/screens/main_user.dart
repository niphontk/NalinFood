import 'package:flutter/material.dart';
import 'package:food/screens/show_cart.dart';
import 'package:food/utility/my_style.dart';
import 'package:food/utility/signout_process.dart';
import 'package:food/widget/show_list_shop_all.dart';
import 'package:food/widget/show_status_food_order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;
  Widget currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = ShowListShopAll();
    findUser();
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
        title: Text(nameUser == null ? 'Main User' : 'สวัสดีคุณ $nameUser'),
        actions: <Widget>[
          MyStyle().iconShowCart(context),
          // IconButton(
          //   icon: Icon(Icons.exit_to_app),
          //   onPressed: () => signOutProcess(context),
          // )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showHead(),
                menuListShop(),
                menuCart(),
                menuStatusFoodOrder(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                menuSignOut(),
              ],
            ),
          ],
        ),
      );

  ListTile menuListShop() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ShowListShopAll();
        });
      },
      leading: Icon(Icons.home),
      title: Text('แสดงร้านค้า'),
      subtitle: Text('แสดงร้านค้า ที่สามารถสั่งอาหารได้'),
    );
  }

  ListTile menuStatusFoodOrder() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ShowStatusFoodOrder();
        });
      },
      leading: Icon(Icons.restaurant_menu),
      title: Text('แสดงรายการอาหารที่สั่ง'),
      subtitle: Text('แสดงรายการอาหารที่สั่ง และยังไม่ได้จัดส่ง'),
    );
  }

  Widget menuSignOut() {
    return Container(
      decoration: BoxDecoration(color: Colors.red.shade700),
      child: ListTile(
        onTap: () => signOutProcess(context),
        leading: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        title: Text(
          'Sign Out',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'ออกจากระบบ',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('user.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        nameUser == null ? 'Name Login' : nameUser,
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }

  Widget menuCart() {
    return ListTile(
      leading: Icon(Icons.add_shopping_cart),
      title: Text('ตะกร้าของฉัน'),
      subtitle: Text('รายการอาหาร ที่อนู่ในตะกร้า ยังไม่ได้ Order'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => ShowCart(),
        );
        Navigator.push(context, route);
      },
    );
  }
}
