import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldtime() async {
    WorldTime instance = WorldTime(
      location: 'Berlin',
      flag: "germany.png.",
      url: "Europe/Berlin",
      time: "",
      isDayTime: true,
    );
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 62, 109),
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
