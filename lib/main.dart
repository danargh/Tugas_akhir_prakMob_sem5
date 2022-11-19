import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run app
  runApp(MyApp());
}
