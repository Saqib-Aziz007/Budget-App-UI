import 'package:flutter/material.dart';

Color? getColor({required BuildContext context, required double percent}) {
  //print(percent);
  if (percent >= 0.50) {
    return Theme.of(context).primaryColor;
  } else if (percent >= 0.25) {
    return Colors.orange;
  }
  return Colors.red[900];
}
