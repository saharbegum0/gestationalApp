import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/Constant/Colors.dart';
import '../Core/Constant/textstyle.dart';
import 'UiComponent/MyTextField.dart';

class UltrasoundPage extends StatefulWidget {

   const UltrasoundPage({Key? key}) : super(key: key);

  @override
  State<UltrasoundPage> createState() => _UltrasoundPageState();
}

class _UltrasoundPageState extends State<UltrasoundPage> {


  final calenderTextController=TextEditingController();
  String? age="2 weeks and 2 days",date="12/2/2022";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: scaffoldBgColor,
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(children: [

          SizedBox(height: 20.h,),


          MyTextField(size: size, textcontroller: calenderTextController, border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),),icon: Icons.calendar_today,text: "Ultrasound ",),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               WeekTextField(lable: "Weeks",width: 180.w,height: 60.h), Spacer(),
              WeekTextField(lable: "Days",width: 190.w,height: 60.h)
            ],
          ),
          SizedBox(height: 20.h,),
          Row(children: [
            SizedBox(height: 4.w,),
            Text("Gestational age : $age")
          ],),
          SizedBox(height: 20.h,),
          Row(children: [
            SizedBox(height: 4.w,),
            Text("Estimated Due Date (EDD) : $date"),
          ],),
          SizedBox(height: 20.h,),
          Row(children: [
            SizedBox(height: 4.w,),
            Text("End of first trimester  : $date"),
          ],),
          SizedBox(height: 20.h,),
          Row(children: [
            SizedBox(height: 4.w,),
            Text("Beginning of third trimester : $date"),
          ],),
          RSizedBox.vertical(20.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(width: 1.w),
                borderRadius: BorderRadius.circular(15.r)
            ),
            alignment: Alignment.center,
            height: 70.h,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(children: [
                  SizedBox(width: 20.w,),


                  Icon(Icons.circle_notifications_outlined),
                  SizedBox(width: 20.w,),
                  Column(
                    children: [
                      const Text("Health bmi for current Gestational Age "),
                      SizedBox(height: 10.h,),
                      Text("Between  20.3 and  25"),

                    ],
                  )
                ],)
              ],)
            ,),
          SizedBox(height: 10.h,),
          Text("Learn how the calculus is done"),

        ],)
    );
  }

  SizedBox WeekTextField({onChange,validator,lable,width,height}) {
    return SizedBox(
      height: height??70.h,
          width: width??170.w,
          child: TextFormField(
           // scrollPadding: EdgeInsets.only(bottom:80.sp),
            style: loginTextStyle2.copyWith(color: Colors.black, fontSize: 22.sp),

           onChanged: onChange,
           validator: validator,
           // keyboardType: keyboardType,
            controller: calenderTextController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0.w),
                ),
                // hintStyle:
                // loginTextStyle2.copyWith(color: Colors.black54, fontSize: 20.sp),
                // hintText: "weeks",
                label: Text(lable),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20.0.sp, horizontal: 20.0.sp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: primaryColor, width: 1.w)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: primaryColor, width: 1.w)),
                //suffixIcon: Icon(icon),
                suffixIconColor: primaryColor
            ),

          ),
        );
  }
}

