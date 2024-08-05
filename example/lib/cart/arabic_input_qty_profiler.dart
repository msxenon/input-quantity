import 'package:flutter/services.dart';
import 'package:input_quantity/input_quantity.dart';

class ArabicInputQtyProfiler extends InputQtyProfiler {
  const ArabicInputQtyProfiler();
  @override
  num? tryParse(String value) {
    final arEn = _arabicToEnglishNumbers(value);
    final enParsed = num.tryParse(arEn);
    return enParsed ?? 0;
  }

  @override
  List<TextInputFormatter> get inputFormatters => [
        // accepts only digits in Arabic and English, and the dot and minus sign
        FilteringTextInputFormatter.allow(RegExp(r'^[\d\u0660-\u0669.-]*$')),
        ArabicDigitsFormatter(),
      ];

  @override
  String toDisplayValue(String stringAsFixed) {
    return _englishToArabicNumbers(stringAsFixed);
  }
}

class ArabicDigitsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final output = _englishToArabicNumbers(newValue.text);
    return TextEditingValue(
      text: output,
      selection: TextSelection.collapsed(offset: output.length),
    );
  }
}

String _englishToArabicNumbers(String input) {
  return input
      .replaceAll('0', '٠')
      .replaceAll('1', '١')
      .replaceAll('2', '٢')
      .replaceAll('3', '٣')
      .replaceAll('4', '٤')
      .replaceAll('5', '٥')
      .replaceAll('6', '٦')
      .replaceAll('7', '٧')
      .replaceAll('8', '٨')
      .replaceAll('9', '٩');
}

String _arabicToEnglishNumbers(String input) {
  return input
      .replaceAll('٠', '0')
      .replaceAll('١', '1')
      .replaceAll('٢', '2')
      .replaceAll('٣', '3')
      .replaceAll('٤', '4')
      .replaceAll('٥', '5')
      .replaceAll('٦', '6')
      .replaceAll('٧', '7')
      .replaceAll('٨', '8')
      .replaceAll('٩', '9');
}
