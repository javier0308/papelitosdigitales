import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void displayDialogAndroid(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xfff9f8f9),
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
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
          child: const Center(
            child: Text(
              'Ok',
              style: TextStyle(
                color: Color(0xff9d2121),
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
