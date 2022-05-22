import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location name for the UI
  String time; // Time in that location
  String flag; // Url to an asset flag locaiton
  String url; // Location url for api endpoint

  WorldTime({ this.location = "", this.flag = "", this.url = "", this.time = ""});

  Future<void> getTime() async{

    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezones/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      time = now.toString();

    } catch (e) {
      print('Caught error: $e')
      time = "Couldn't get time data";
    }
  }
}
