 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/textstyle.dart';

class UnitChangeDialog extends StatefulWidget {
  const UnitChangeDialog ({Key? key}) : super(key: key);

  @override
  State<UnitChangeDialog> createState() => _UnitChangeDialogState();
}

class _UnitChangeDialogState extends State<UnitChangeDialog> {
  String SearchText = "Search for Medicine";
  int? _groupValue = 1;
  int gvalue = 1;
  int? a;

    List <String>avaliableForms=['English','Urdu','Spanish'];
    Widget height(double? ht){
      return SizedBox(
        height:ht?.toDouble().h

      );

    }
    Widget width(double? w){
      return SizedBox(
        width:w?.toDouble().w ,

      );}

      @override
  Widget build(BuildContext context) {
    String selectedFrom = "English";

    return AlertDialog(
      title: Column(
        children:  [
         const Text("Languages"),
          height(20),

          Container(

            height: 50.h,
            width: 100.w,
            // child: InputDecorator(
            //   decoration: InputDecoration(
            //
            //     contentPadding:
            //     EdgeInsets.fromLTRB(8.sp, 0.sp, 0.sp, 0.sp),
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.white,width: 1.5),
            //       borderRadius:
            //       BorderRadius.all(
            //
            //           Radius.circular(15.0.r)),
            //     ),
            //   ),
              child: DropdownButtonHideUnderline(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(

                      child: DropdownButton(


                        alignment: AlignmentDirectional.centerStart,

                        focusColor: Color(0xff264A4C4F),
                        isExpanded: true,
                        value: selectedFrom,
                        icon: Icon( Icons.arrow_drop_down,
                          color: primaryColor,
                          size: 37,),

                        items: avaliableForms.map((items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items,style:presTextStyle1.copyWith(fontSize: 18.sp)));
                        }).toList(),
                        onChanged: (String? val) {
                          // myModle.updateSelectedFroms(val);
                          print("");

                        },

                      ),
                    ),
                  ],
                ),
              ),
            ),
          height(20),
          const Text("BMI Units"),
          height(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: 0,
                      groupValue: _groupValue,
                      onChanged: (int? b) {
                        setState(() {
                          _groupValue = b;
                          a = b;


                        });
                      }),

                  Text(
                    'Metric(kg,centimeter) ',
                    style: appBarstyle.copyWith(
                        fontSize: 19.sp,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400),
                  ),
                  width(15),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [


                  Radio(
                      value: gvalue,
                      groupValue: _groupValue,
                      onChanged: (int? b) {
                        setState(() {
                          _groupValue = b;
                          a = b;


                        });
                      }),
                  Text('Imperial(lbs,feet,inches)',
                      style: appBarstyle.copyWith(
                          fontSize: 19.sp,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),


        ],

      ),


    );
  }
}


