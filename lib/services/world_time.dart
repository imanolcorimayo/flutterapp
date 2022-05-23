import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  String time; // Time in that location
  String flag; // Url to an asset flag locaiton
  String url; // Location url for api endpoint
  bool isDayTime; // True or false if daytime or not

  WorldTime({ this.location = "", this.flag = "", this.url = "", this.time = "", this.isDayTime=false});

  Future<void> getTime() async{

    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    } catch (e) {
      print('Caught error: $e');
      time = "Couldn't get time data";
    }
  }
}
