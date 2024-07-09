import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ungofficer/widgets/widget_button.dart';

class AppDialog {
  void normalDialog({
    required String title,
    Widget? icon,
    Widget? content,
    Widget? firstAction,
  }) {
    Get.dialog(AlertDialog(
      scrollable: true,
      title: Text(title),
      icon: icon,
      content: content,
      actions: [
        firstAction ?? const SizedBox(),
        WidgetButton(
          type:
              firstAction == null ? GFButtonType.solid : GFButtonType.outline2x,
          text: firstAction == null ? 'OK' : 'Cancel',
          onPressed: () => Get.back(),
        )
      ],
    ));
  }
}
