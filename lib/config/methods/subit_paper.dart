import 'package:cloud_firestore/cloud_firestore.dart';

void submitPaper([String? title, String? papelito]) {
  FirebaseFirestore.instance.collection("papelitos").add(
    {
      'papelito': title ?? 'vacio',
      'nick': papelito ?? 'vacio',
    },
  );
}