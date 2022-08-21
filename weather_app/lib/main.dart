import 'package:flutter/material.dart';

import 'homePage/index.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
        initialRoute: '/homePage',
        routes: {
          '/homePage': (context) => const HomePage(),

          // '/login': (context) => Login(),
          // '/register': (context) => Register(),
          // '/homeScreen': (context) => HomeScreen(),
          // '/cartScreen': (context) => const cartScreen(),
        }));
