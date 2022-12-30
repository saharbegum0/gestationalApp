



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/Constant/Colors.dart';
import '../Core/Constant/textstyle.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'UiComponent/UnitChangeDialog.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {

  final calenderTextController=TextEditingController();
  String? m;
  String? kgMetr="kg/m^2"
  ,date="12/2/2022";
  String unit="lbs";
  String feet="feet";
  String inches="Inches";
  String GtAge="20-29.4";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigt=size.height;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

      child: Container(
        height: heigt.h,
          color: scaffoldBgColor,
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(children: [

            SizedBox(height: 20.h,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeekTextField(lable: "Weeks",width: 180.w,height: 60.h), Spacer(),
                WeekTextField(lable: "Weight ($unit)",width: 190.w,height: 60.h)
              ],
            ),
            SizedBox(height: 20.h,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeekTextField(lable: "Height ($feet)",width: 160.w,height: 60.h),
                WeekTextField(lable: "Height ($inches)",width: 170.w,height: 60.h),

            IconButton(

                      onPressed: () {
                        showDialog(context: context, builder: (context)=>UnitChangeDialog()

                        );
                      },
                      icon: Icon(Icons.loop_sharp,size: 50.sp,color: primaryColor,)),

              ],
            ),
            SizedBox(height: 20.h,),
            _getRadialGauge(),// bmi indicator

            Row(children: [
              SizedBox(height: 4.w,),
              Text("Body Mass Index (BMI): $kgMetr")
            ],),
            SizedBox(height: 20.h,),
            Row(children: [
              SizedBox(height: 4.w,),
              const Text("Category"),
            ],),
            SizedBox(height: 20.h,),
            Row(children: [
              SizedBox(height: 4.w,),
              Text("Health Bmi for current gestational Age: $GtAge $kgMetr"),
            ],),
            SizedBox(height: 20.h,),

            const Text("Learn how the calculus is done"),

          ],)
      ),
    );
  }

  Widget WeekTextField({onChange,validator,lable,width,height}) {
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
            label: Text(lable,textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,),
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
  Widget _getRadialGauge() {
    double width=55.w;
    return Container(
     // color: Colors.green,
      width: 420.w,
      child: SfRadialGauge(


        enableLoadingAnimation: true,
          animationDuration: 1000,
          // title: GaugeTitle(
          //     text: 'Speedometer',
          //     textStyle:
          //     const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          axes: <RadialAxis>[
            RadialAxis(

              canScaleToFit: true,
               //minorTicksPerInterval: 4,
              tickOffset: 4,
              // startAngle: 100,
              //   endAngle: 80,
                showLastLabel:true,
              ticksPosition: ElementsPosition.outside,
              labelsPosition: ElementsPosition.outside,
                minimum: 17, maximum: 35, ranges: <GaugeRange>[
              GaugeRange(
                label: "Low Weight",
                  startValue: 17,
                  endValue: 20,
                  color: Colors.yellow,
                  startWidth: width,
                  endWidth: width),
              GaugeRange(
                  label: "Healthy",
                  startValue: 20,
                  endValue: 25,
                  color: Colors.green,
                  startWidth: width,
                  endWidth: width),
              GaugeRange(
                  label: "Over Weight",
                  startValue: 25,
                  endValue: 30,
                  color: Colors.orange,
                  startWidth: width,
                  endWidth: width),
              GaugeRange(
                  label: "Obesity",
                  startValue: 30,
                  endValue: 35,
                  color: Colors.red,
                  startWidth:width,
                  endWidth: width)
            ], pointers: const <GaugePointer>[
              NeedlePointer(value: 0)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: const Text('0.0',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  angle: 90.r,
                  positionFactor: 0.6)
            ])
          ]),
    );
  }
}

