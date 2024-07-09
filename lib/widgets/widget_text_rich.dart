import 'package:flutter/material.dart';

class WidgetTextRich extends StatelessWidget {
  const WidgetTextRich({
    super.key,
    required this.head,
    required this.value,
  });

  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: head,
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: ' : ',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          TextSpan(
              text: value,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
