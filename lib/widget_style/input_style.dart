import 'package:flutter/material.dart';

class WidgetStyle {
  static InputDecoration inputDecoration(
          {required String label, required String hint}) =>
      InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          isDense: true,
          focusColor: Colors.indigo,
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: hint);
}
