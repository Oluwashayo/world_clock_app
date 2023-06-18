import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {
    parameters = ModalRoute.of(context)!.settings.arguments;
    parameters =
        data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments;
    data = jsonDecode(jsonEncode(parameters));

    // print(data);

    // set background
    String bgImage = data["isDayTime"] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Images/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = result;
                  });
                },
                icon: const Icon(Icons.edit_location),
                label: const Text(
                  "Edit location",
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data["time"],
                style: const TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
