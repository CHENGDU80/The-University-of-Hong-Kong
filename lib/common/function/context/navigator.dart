import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void replacePush(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

/// remove all routes then push
void removePush(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

void popPush(BuildContext context, Widget page) {
  Navigator.pop(context);
  pushPage(context, page);
}

void popUntilHome(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}
