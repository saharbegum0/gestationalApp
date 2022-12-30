

import 'package:gestationalage/Core/Services/DatePikerClass.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class LMP_ViewModel extends ChangeNotifier{
  final lmpDateController=TextEditingController();
  String? pikedDate,eddDate,eddFirst1,eddFirst2;
  DateTime dateNow = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime? picked;
  int? totalDays;
  int week = 0;
  int days = 0;

  int week2 = 0;
  int days2 = 0;

  int days3 = 0;
  DateTime? edd;
  DateTime? eddFirst;
  DateTime? eddSec;

  DateTime? eddUtra;
  DateTime? eddFirstUtra;
  DateTime? eddSecUtra;
  int ultraGestationAge = 0;


   datePiker(context)async{
     dateNow = DateTime.now();
     picked=  await DatePikerClass. selectDate(context);
     pikedDate=DateFormat.yMd().format(picked!);
     lmpDateController.text=pikedDate!;
     notifyListeners();
     showResultDueData();
     showFirstDueData();
     showSecDueData();
   }
/// Lmp calculations
  ///
  showResultDueData() {
    totalDays = dateNow.difference(picked!).inDays;
    print('test dAys  $totalDays');
    double dweek = totalDays! / 7;
    week = ((dweek.toInt()));
    days = totalDays! % 7;
    edd = picked!.add(const Duration(days: 280));
    eddDate=DateFormat.yMd().format(edd!);
    selectedDate = picked!;
    notifyListeners();
  }

  showFirstDueData() {
    totalDays = dateNow.difference(picked!).inDays;
    double dweek = totalDays! / 7;
    week = dweek.toInt();
    days = totalDays! % 7;
    eddFirst = picked!.add(const Duration(days: 97));
    selectedDate = picked!;
    eddFirst1=DateFormat.yMd().format(eddFirst!);
    notifyListeners();
  }

  showSecDueData() {
    totalDays = dateNow.difference(picked!).inDays;
    double dweek = totalDays! / 7;
    week = dweek.toInt();
    days = totalDays! % 7;
    eddSec = picked!.add(const Duration(days: 196));
    eddFirst2=DateFormat.yMd().format(eddSec!);
    notifyListeners();
  }


  // for ultrasound  calculations
  showResultUltrasoundDueData(int w, int d) {
    totalDays = dateNow.difference(picked!).inDays;
    ultraGestationAge = (w * 7) + d;
    double dweek = totalDays! / 7 + ultraGestationAge / 7;
    week2 = dweek.toInt();
    days2 = totalDays! % 7 + d % 7;
    days3 = days2 % 7;
    eddUtra = picked!.add(Duration(days: 280 - ultraGestationAge));
    selectedDate = picked!;
    notifyListeners();
  }

  showUltraSoundFirstDueData() {
    totalDays = dateNow.difference(picked!).inDays;
    double dweek = totalDays! / 7;
    week = dweek.toInt();
    days = totalDays! % 7;
    eddFirstUtra = picked!.add(Duration(days: 97 - ultraGestationAge));
    selectedDate = picked!;
    notifyListeners();
  }

  showUltraSoundSecDueData() {
    totalDays = dateNow.difference(picked!).inDays;
    double dweek = totalDays! / 7;
    week = dweek.toInt();
    days = totalDays! % 7;
    eddSecUtra = picked!.add(Duration(days: 196 - ultraGestationAge));
    selectedDate = picked!;
    notifyListeners();
  }

}