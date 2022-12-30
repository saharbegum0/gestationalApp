import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  // @override
  // TextEditingValue formatEditUpdate(
  //     TextEditingValue previousValue,
  //     TextEditingValue nextValue,
  //     ) {
  //   var inputText = nextValue.text;
  //
  //   if (nextValue.selection.baseOffset == 0) {
  //     return nextValue;
  //   }
  //
  //   var bufferString = StringBuffer();
  //   for (int i = 0; i < inputText.length; i++) {
  //     bufferString.write(inputText[i]);
  //     var nonZeroIndexValue = i + 1;
  //     if (nonZeroIndexValue % 2 == 0 && nonZeroIndexValue != inputText.length) {
  //       bufferString.write('/');
  //     }
  //   }
  //
  //   var string = bufferString.toString();
  //   return nextValue.copyWith(
  //     text: string,
  //     selection: TextSelection.collapsed(
  //       offset: string.length,
  //     ),
  //   );
  // }
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + '/');
      if (newValue.selection.end >= 2)
        selectionIndex ++;
    }
    if (newTextLength >= 5) {
      newText.write(newValue.text.substring(2, usedSubstringIndex = 4) + '/');
      if (newValue.selection.end >= 4)
        selectionIndex++;
    }
    if (newTextLength >= 9) {
      newText.write(newValue.text.substring(4, usedSubstringIndex = 7));
      if (newValue.selection.end >= 7) {
       // selectionIndex++;
      }

    }
// Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}