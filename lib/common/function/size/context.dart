import 'package:flutter/material.dart';

Size contextSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double contextWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double contextHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
