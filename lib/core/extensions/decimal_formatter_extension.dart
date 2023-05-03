import 'package:fantasy_store/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {

  int? maxDecimalDigits;

  DecimalTextInputFormatter({this.maxDecimalDigits});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, // unused.
      TextEditingValue newValue,
      ) {

    String englishValue = newValue.text.englishNumber()??"";
    debugPrint('english value $englishValue');
    final regEx = maxDecimalDigits == null ? RegExp(r'^\d*\.?\d*$') : RegExp(r'^\d*\.?\d'+'{0,$maxDecimalDigits}'+r'$');
    final newStringMatches = regEx.hasMatch(englishValue);
    if(newStringMatches){
      String displayedText = englishValue;
      if(displayedText.startsWith('.')) displayedText = '0$displayedText';
      displayedText = displayedText.replaceAll(".", "٫");

      return TextEditingValue(
          text: displayedText,
          selection: TextSelection(
              baseOffset: displayedText.length,
              extentOffset: displayedText.length
          )
      );
    }
    return oldValue;
  }
}

