import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      if (response.statusCode == 200) {
        Map jsonResponse = convert.jsonDecode(response.body);
        String datetime = jsonResponse['datetime'];
        String offset = jsonResponse['utc_offset'].substring(1,3);
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        isDayTime = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      } else {
        throw('Request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed $e');
      time = 'could not get time data';
    }
  }
}
