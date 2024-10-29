import 'package:chengdu80_prototype/common/page/load/widget.dart';
import 'package:flutter/material.dart';

DialogRoute? _loadingRoute;

void showLoading(BuildContext context, [String? message]) {
  _loadingRoute = DialogRoute(
    context: context,
    barrierDismissible: false,
    builder: (context) => LoadingWidget(
      message: message,
    ),
  );
  Navigator.push(context, _loadingRoute!);
}

void hideLoading(BuildContext context) {
  if (_loadingRoute == null) return;
  if (!_loadingRoute!.isActive) return;
  Navigator.removeRoute(context, _loadingRoute!);
  _loadingRoute = null;
}
