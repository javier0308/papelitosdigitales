import 'package:flutter/material.dart';

import 'package:hablandohuevadasf/config/config.dart';

import 'package:quickalert/quickalert.dart';

void alertQuick(
  BuildContext context,
) {
  QuickAlert.show(
      titleColor: primaryColor,
      animType: QuickAlertAnimType.rotate,
      barrierDismissible: false,
      confirmBtnColor: primaryColor,
      title: 'PAPELITO ENVIADO',
      context: context,
      type: QuickAlertType.success);
}
