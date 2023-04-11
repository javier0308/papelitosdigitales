import 'package:flutter/material.dart';

class FormStateProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();

  bool _submit = false;

  bool get submit => _submit;

  set submit(bool value) {
    _submit = value;
    notifyListeners();
  }
}
