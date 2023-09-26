import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

import '../service/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDayTime: false),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png', isDayTime: false),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDayTime: false),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDayTime: false),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDayTime: false),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDayTime: false),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDayTime: false),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDayTime: false),
  ];

  void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context, {
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isDaytime': instance.isDayTime,
      });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },),
      // body: ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter +=1;
      // });
      // },
      //  // child: Text('counter is $counter'),
      // )
    );
  }
}
