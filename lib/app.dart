import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_tips/constants/app_colors.dart';
import 'package:valorant_tips/screens/custom_error_screen.dart';
import 'package:valorant_tips/screens/error_screen.dart';
import 'package:valorant_tips/screens/main_screen.dart';

import 'models/network_result.dart';
import 'network/network_manager.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late final NetworkManager _networkManager;
  NetworkResult? _networkResult;

  // @override
  // void initState() {
  //   super.initState();
  //   _networkManager = NetworkManager();
  //   _networkManager.handleNetworkChange((result) {
  //     setState(() {
  //       _networkResult = result;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        theme: AppTheme().valoTheme,
      ),
    );
  }
}
