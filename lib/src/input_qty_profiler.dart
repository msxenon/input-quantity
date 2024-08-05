import 'package:flutter/services.dart';

abstract class InputQtyProfiler {
  const InputQtyProfiler();
  num? tryParse(String value);
  List<TextInputFormatter> get inputFormatters;

  String toDisplayValue(String stringAsFixed);
}

class DefaultQtyProfiler extends InputQtyProfiler {
  const DefaultQtyProfiler();
  @override
  num tryParse(String value) => num.tryParse(value) ?? 0;
  @override
  List<TextInputFormatter> get inputFormatters =>
      [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\-?\d*'))];

  @override
  String toDisplayValue(String stringAsFixed) {
    return stringAsFixed;
  }
}
