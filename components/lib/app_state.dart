import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isUpdate = false;
  bool get isUpdate => _isUpdate;
  set isUpdate(bool value) {
    _isUpdate = value;
  }

  List<String> _validationMessages = [];
  List<String> get validationMessages => _validationMessages;
  set validationMessages(List<String> value) {
    _validationMessages = value;
  }

  void addToValidationMessages(String value) {
    validationMessages.add(value);
  }

  void removeFromValidationMessages(String value) {
    validationMessages.remove(value);
  }

  void removeAtIndexFromValidationMessages(int index) {
    validationMessages.removeAt(index);
  }

  void updateValidationMessagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    validationMessages[index] = updateFn(_validationMessages[index]);
  }

  void insertAtIndexInValidationMessages(int index, String value) {
    validationMessages.insert(index, value);
  }
}
