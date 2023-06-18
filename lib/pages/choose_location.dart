import 'package:flutter/material.dart';
import 'package:world_clock_app/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    List<WorldTime> locations = [
      WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'Africa/lagos',
        location: 'Lagos',
        flag: 'nigeria.jpg',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        time: "",
        isDayTime: true,
      ),
      WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        time: "",
        isDayTime: true,
      ),
    ];

    void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();

      // navigate to home screen

      // ignore: use_build_context_synchronously
      Navigator.pop(context, {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 227, 227),
      appBar: AppBar(
        title: const Text("Choose a location"),
        backgroundColor: const Color.fromARGB(255, 1, 19, 44),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Images/night2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                color: Colors.transparent,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("Images/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
