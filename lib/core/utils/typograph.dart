import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wayu_test/core/utils/colors.dart';

class CustomTypograph {
  static const TextStyle lightSubtitle = TextStyle(
    fontSize: 16.0,
    color: MyColors.greyLight,
  );

  static const TextStyle boldSubtitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const TextStyle boldTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  static const TextStyle normalText = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
  );
}
