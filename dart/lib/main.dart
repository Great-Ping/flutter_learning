import 'package:flutter/material.dart';
import 'app/widget.dart';
import 'app/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await setupLocatorAsync();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const FckUpFlutterApp());
}
