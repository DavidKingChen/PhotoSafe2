import 'dart:async';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';

class MapPage extends StatefulWidget {

  final String lat;
  final String long;

  const MapPage({Key? key, required this.lat,required this.long}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Map<String,Object>_locationResult = {};

  StreamSubscription<Map<String,Object>>? _locationListener;

  AMapFlutterLocation _locationPlugin = AMapFlutterLocation();


  double? latitude;
  double? longitude;

  void _setLoctionOption(){
    AMapLocationOption locationOption = AMapLocationOption();

    locationOption.onceLocation = true;
    locationOption.distanceFilter = -1;

    print("_setLoctionOption === ");
    locationOption.desiredAccuracy = DesiredAccuracy.Best;
    _locationPlugin.setLocationOption(locationOption);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AMapFlutterLocation.setApiKey(
        "1f32b7b95ee1a0c3bf4ab8974dfe2c44", "3f88334907f92ea79cf9c5dfcb18dbfa");

    print(widget.lat);

    requestAccuracyAuthorization();

    _locationListener = _locationPlugin
        .onLocationChanged()
    .listen((event) {
      // if(event != null){
        setState(() {

          // print(event["latitude"]);

          _locationResult = event;


          // Object? latitudeObj = event["latitude"];
          // latitude = latitudeObj as double;
          // if(latitude!=null){
          //   latitude = latitudeObj as double;
          // }
          print(latitude);

          // Object? longitudeObj = event["longitude"];
          // longitude = longitudeObj as double;
          // if(longitude!=null){
          //   longitude = longitudeObj as double;
          // }
          print(longitude);
        });
      // }

    });


    _locationPlugin.startLocation();
  }


  @override
  Widget build(BuildContext context) {
    _setLoctionOption();

    String? latD = "0.0";
    String? longD = "0.0";

    if(_locationResult["latitude"] != null){
      latD = _locationResult["latitude"]!.toString();
    }
    if(_locationResult["longitude"] != null){
      longD = _locationResult["longitude"]!.toString();

    }



    LatLng abc = LatLng(double.parse(widget.long),double.parse(widget.lat));

    // if(latitude!= null && longitude != null){
    //   abc = LatLng(latitude!,longitude!);
    // }



    final AMapWidget map = AMapWidget(
      apiKey: AMapApiKey(
        iosKey: "3f88334907f92ea79cf9c5dfcb18dbfa",
        androidKey: "1f32b7b95ee1a0c3bf4ab8974dfe2c44",
      ),
      initialCameraPosition: CameraPosition(
          target: abc,
      ),
        // minMaxZoomPreference: MinMaxZoomPreference(),
        myLocationStyleOptions: MyLocationStyleOptions(true),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: map,
      ),
    );
  }

  ///获取iOS native的accuracyAuthorization类型
  void requestAccuracyAuthorization() async {
    AMapAccuracyAuthorization currentAccuracyAuthorization =
    await _locationPlugin.getSystemAccuracyAuthorization();
    if (currentAccuracyAuthorization ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationFullAccuracy) {
      print("精确定位类型");
    } else if (currentAccuracyAuthorization ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationReducedAccuracy) {
      print("模糊定位类型");
    } else {
      print("未知定位类型");
    }
  }

}

