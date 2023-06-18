import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in the location
  String flag; // Url to an asset flag icon
  String url;
  bool isDayTime; // true or false if day or night

  WorldTime(
      {required this.location,
      required this.time,
      required this.flag,
      required this.url,
      required this.isDayTime});

  Future<void> getTime() async {
    try {
      // make a request
      Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$url"),
      );
      Map data = jsonDecode(response.body);

      //Get properties from data
      String dataTime = data['datetime'];
      String offSet = data['utc_offset'].substring(0, 3);

      // Create a data time object

      DateTime now = DateTime.parse(dataTime);
      now = now.add(
        Duration(
          hours: int.parse(offSet),
        ),

        // set the time property
      );
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 18;
    } catch (e) {
      print("Caught error: $e");
      time = "Could not get time data";
    }
  }
}
