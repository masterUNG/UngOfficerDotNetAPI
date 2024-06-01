import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ungofficer/states/list_officer.dart';
import 'package:ungofficer/utility/app_http_override.dart';

void main() {
  HttpOverrides.global = AppHttpOverride();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListOfficer(),
    );
  }
}
