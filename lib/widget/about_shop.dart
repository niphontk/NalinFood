import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food/model/user_model.dart';
import 'package:food/utility/my_api.dart';
import 'package:food/utility/my_constant.dart';
import 'package:food/utility/my_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class AboutShop extends StatefulWidget {
  final UserModel userModel;
  AboutShop({Key key, this.userModel}) : super(key: key);
  @override
  _AboutShopState createState() => _AboutShopState();
}

class _AboutShopState extends State<AboutShop> {
  UserModel userModel;
  double lat1, lng1, lat2, lng2, distance;
  String distanceString;
  int transport;
  CameraPosition position;

  void initState() {
    super.initState();
    userModel = widget.userModel;
    findLat1Lng1();
  }

  Future<Null> findLat1Lng1() async {
    LocationData locationData = await findLocationData();
    setState(() {
      lat1 = locationData.latitude;
      lng1 = locationData.longitude;
      lat2 = double.parse(userModel.lat);
      lng2 = double.parse(userModel.lng);

      print('lat1 = $lat1, lng1 = $lng1, lat2 = $lat2, lng2 = $lng2');
      distance = MyAPI().calculateDistance(lat1, lng1, lat2, lng2);
      
      var myFormat = NumberFormat('#0.0#', 'en_US');
      distanceString = myFormat.format(distance);

      transport = MyAPI().calculateTransport(distance);

      print('distance = $distance');
      print('transport = $transport');
    });
  }
  

  Future<LocationData> findLocationData() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                width: 250.0,
                height: 250.0,
                child: Image.network(
                  '${MyConstant().domain}${userModel.urlPicture}',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(userModel.address),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(userModel.phone),
          ),
          ListTile(
            leading: Icon(Icons.directions_bike),
            title: Text(distance == null ? '' : '$distanceString กิโลเมตร'),
          ),
          ListTile(
            leading: Icon(Icons.transfer_within_a_station),
            title: Text(transport == null ? '' : '$transport บาท'),
          ),
          showMap(),
        ],
      ),
    );
  }

  Container showMap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1, lng1);
      position = CameraPosition(
        target: latLng1,
        zoom: 16.0,
      );
    }

    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat1, lng1),
        icon: BitmapDescriptor.defaultMarkerWithHue(60.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ที่นี่'),
      );
    }

    Marker shopMarker() {
      return Marker(
        markerId: MarkerId('shopMarker'),
        position: LatLng(lat2, lng2),
        icon: BitmapDescriptor.defaultMarkerWithHue(150.0),
        infoWindow: InfoWindow(title: userModel.nameShop),
      );
    }

    Set<Marker> mySet(){
      return <Marker>[userMarker(),shopMarker()].toSet();
    }

    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
      height: 250.0,
      child: lat1 == null
          ? MyStyle().showProgress()
          : GoogleMap(
              initialCameraPosition: position,
              mapType: MapType.normal,
              onMapCreated: (controller) => {},markers: mySet(),
            ),
    );
  }
}
