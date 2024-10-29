import 'package:flutter/material.dart';

void postFrame(final void Function() callBack) {
  WidgetsBinding.instance.addPostFrameCallback(
    (timeStamp) {
      callBack();
    },
  );
}
