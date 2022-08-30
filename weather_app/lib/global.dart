library my_prj.globals;

import 'package:flutter/cupertino.dart';

final kBoxDecorationStyle = BoxDecoration(
  // color: Color(0xFF272635),
  color: const Color(0xFF0000),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Color(0xFFFFFFFF),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
