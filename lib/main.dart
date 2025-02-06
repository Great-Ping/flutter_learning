import 'package:flutter/material.dart';
import 'package:flutter_learning/app/app.dart';

import 'app/widget.dart';

void main() async {
  await setupLocatorAsync();

  runApp(const FckUpFlutterApp());
}
