import 'package:flutter/material.dart';
import 'package:flutterapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }
  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.amber,
          size: 90.0,
        ),
      ),
    );
  }
}
