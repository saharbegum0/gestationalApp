
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePikerClass{

  static Future<DateTime> selectDate(BuildContext context) async {
    String? date;
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now().add(Duration(days:-720)),
        lastDate: DateTime.now());
    if (picked != null) {
      selectedDate = picked;
    }
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    // var outputDate = outputFormat.format(inputDate);
     date = DateFormat.yMd().format(selectedDate);
    return selectedDate;
  }




}