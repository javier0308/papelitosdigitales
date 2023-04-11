import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void alertQuick(BuildContext context) {
  QuickAlert.show(
      titleColor: const Color(0xff9d2121),
      animType: QuickAlertAnimType.rotate,
      barrierDismissible: false,
      confirmBtnColor: const Color(0xff9d2121),
      title: 'PAPELITO ENVIADO',
      context: context,
      type: QuickAlertType.success);
}
