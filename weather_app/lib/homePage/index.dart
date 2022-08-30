import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
// import "../current_position.dart";
import '../global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _destination = TextEditingController();
  WeatherFactory wf = WeatherFactory("fe973611595b6568ced9c13e7c266a37",
      language: Language.FRENCH);
  List<Weather> _data = [];

  // _getCurrentLocation() {
  //   print("_getCurrentLocation");
  //   print("_getCurrentLocation");
  //   print("_getCurrentLocation");
  //   print("_getCurrentLocation");
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       Position _currentPosition = position;
  //       print(_currentPosition);
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  Widget _inputDestination(widthMobile) {
    return SizedBox(
      width: widthMobile / 2,
      child: TextField(
        onSubmitted: (value) async {
          print(value);
          Weather w = await wf.currentWeatherByCityName(value);
          print("w ->");
          print(w);
          setState(() {
            _data = [w];
          });
        },
        controller: _destination,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Entrer une destination',
        ),
      ),
    );
  }

  Widget _meteoInfo() {
    var fixDate = _data[0].date.toString().split(" ");
    var getTime = fixDate[1].substring(0, 5);
    var fixTemperature = _data[0].temperature.toString().split('e');
    var iconUrl = "http://openweathermap.org/img/w/${_data[0].weatherIcon}.png";
    return Column(
      children: [
        Container(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${_data[0].areaName} ${_data[0].country}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Image.network(
                  iconUrl,
                  width: MediaQuery.of(context).size.width / 10,
                ),
              ],
            )),
        Text(fixTemperature[0]),
        Text(_data[0].weatherDescription.toString()),
        SizedBox(
          height: MediaQuery.of(context).size.height / 20,
        ),
        Text("dernière MÀJ : ${fixDate[0]}"),
        Text("A $getTime"),
      ],
    );
    // return Center(
    //   child: Container(
    //     child: Text(_data[0].date.toString()),
    //   ),
    // );
  }

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
//    final Widget logo = SvgPicture.asset("assets/weather-app.svg");
  }

  @override
  Widget build(BuildContext context) {
    double heightMobile = MediaQuery.of(context).size.height;
    double widthMobile = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(height: heightMobile / 5),
          Text(
            "Weather App",
            style: TextStyle(fontSize: widthMobile / 10),
          ),
          SizedBox(height: heightMobile / 12),
          _inputDestination(widthMobile),
          SizedBox(height: heightMobile / 12),
          Container(
            width: widthMobile / 1.5,
            height: heightMobile / 5,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: _data.isEmpty ? null : _meteoInfo(),
          ),
          SizedBox(height: heightMobile / 8),
          Expanded(
            child: Image.asset(
              "assets/weather-app.png",
              width: widthMobile / 2,
            ),
          ),
        ],
      )),
    );
  }
}
