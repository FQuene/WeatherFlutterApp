import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _destination = TextEditingController();

  Widget _inputDestination() {
    return Container(
        alignment: Alignment.center,
        child: Expanded(
          child: TextFormField(
            controller: _destination,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Color(0XFF34495E)),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
//    final Widget logo = SvgPicture.asset("assets/weather-app.svg");
  }

  @override
  Widget build(BuildContext context) {
    double heightMobile = MediaQuery.of(context).size.height;
    double widthMobile = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(height: heightMobile / 5),
          Text(
            "Weather App",
            style: TextStyle(fontSize: widthMobile / 10),
          ),
          SizedBox(height: heightMobile / 6),
          Image.asset(
            "assets/weather-app.png",
            width: widthMobile / 5,
          ),
        ],
      )),
    );
  }
}
