import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart'
    show showCupertinoDialog, CupertinoAlertDialog;
import 'package:flutter/material.dart';

void displayDialogIOS(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Center(
          child: Bounce(
            from: 22,
            infinite: true,
            child: const Text(
              '¡GRACIAS!',
              style: TextStyle(
                  color: Color(0xff9d2121),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'su papelito fue enviado con éxito',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/alertdialog.jpg')
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Color(0xff9d2121),
              ),
            ),
          ),
        ],
      );
    },
  );
}
