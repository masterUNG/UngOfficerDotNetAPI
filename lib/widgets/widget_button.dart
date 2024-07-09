import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type,
  });

  final String text;
  final Function() onPressed;
  final GFButtonType? type;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: onPressed,
      text: text,
      color: Theme.of(context).primaryColor,
      type: type ?? GFButtonType.solid,
    );
  }
}
