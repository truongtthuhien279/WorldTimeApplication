import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class WorldTime{
  late String location; // ten nuoc
  late String time;
  late String flag; //assets
  late String url; // link
  bool isDayTime;

  WorldTime ({ required this.location, required this.flag, required this.url, required this.isDayTime});

  Future<void> getTime() async{

    try{
      //Thực hiện yêu cầu
      var urls = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(urls);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print('caught error : $e');
      time = 'could not get time data';

    }


  }
}


