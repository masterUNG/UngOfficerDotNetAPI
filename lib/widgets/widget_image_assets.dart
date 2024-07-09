// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImageAssets extends StatelessWidget {
  const WidgetImageAssets({
    super.key,
    required this.name,
    this.width,
  });

  final String name;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      width: width,
    );
  }
}
