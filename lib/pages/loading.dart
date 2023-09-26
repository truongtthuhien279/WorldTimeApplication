import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int counter =0;
  //void getData() async{
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    //
    // Response response = await get(url);
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

  //   // mô phỏng một yêu cầu mạng, tên người dùng từ một loại cơ sở dữ liệu nào đó
  //
  //   String username = await  Future.delayed(Duration(seconds:3 ), () {
  //     return 'hienthu';
  //   });
  //   // mô phỏng một yêu cầu mạng, lấy tiểu sử của tên người dung, vì vật chúng tôi cần
  //   String bio = await Future.delayed(Duration(seconds:2 ), () {
  //     return('hien thu, boxing & egg collection');
  //   });
  //   print('$username = $bio');
  //

  // void getTime() async{
  //   //Thực hiện yêu cầu
  //   var url = Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London');
  //   Response response = await get(url);
  //   Map data = jsonDecode(response.body);
  //
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1,3);
  //
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(hours: int.parse(offset)));
  //   print(now);
  // }
  String times = 'loading';
  Future<void> setupWorldTime() async {

      WorldTime instance = WorldTime(location: 'Berlin',  flag: 'germany', url: 'Europe/London', isDayTime: false);
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
      print(instance.time);
      // setState(() {
      //   times = instance.time;
      // });
      // print("----------");

      print(times);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green,
      body:Center(
        child: SpinKitPumpingHeart(
          color: Colors.amber,
          size: 50.0,
        ),
      )
    );
  }
}
