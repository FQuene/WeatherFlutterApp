import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
//    final Widget logo = SvgPicture.asset("assets/weather-app.svg");
  }

  @override
  Widget build(BuildContext context) {
    final Widget logo = SvgPicture.asset("assets/weather-app.svg");
    double heightMobile = MediaQuery.of(context).size.height;
    double widthMobile = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            SizedBox(
              height: heightMobile / 3,
            ),
            Text(
              "Weather App",
              style: TextStyle(fontSize: widthMobile / 10),
            ),
            SizedBox(
              height: heightMobile / 3,
            ),
            Image.asset(
              "assets/weather-app.png",
              width: widthMobile / 5,
            ),
          ],
        )
      ]),
    );
  }
}
