import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestationalage/Core/Constant/Colors.dart';

import 'UiComponent/MyTextField.dart';
import 'UiComponent/Tabbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _mySelectedpage = 0;

  PageController? _pageController=PageController();


  void _onchangepage(int pagenum) {
    setState(() {
      _mySelectedpage = pagenum;
      _pageController?.animateToPage(
        pagenum,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }
  void onSelected(choice) {
    // model bottom sheet  for option menu  on selected item method

    if (choice == 1) {
      int? bId = null;
      String? gName;
      int? cId;
      String? bName;


    }
  }
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: primaryColor,
        toolbarHeight: 100.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [

          Padding(
            padding:  EdgeInsets.only(left: 8.0.sp),
            child: SizedBox(child: Text("Gestational Age Calculate"),),
          ),
          SizedBox(width: 50,),
          Text("Clear"),Spacer(),

          Align(
            alignment: Alignment.centerRight,
          child:
            PopupMenuButton(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(0),
                color: Colors.white,
                onSelected: onSelected,
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text("Try any feature free",),
                        // style: appBarstyle.copyWith(
                        //     fontSize: 16.sp,
                        //     color: Color(0xff333333),
                        //     fontWeight: FontWeight.w400)),
                    value: 1,
                    padding: EdgeInsets.only(left: 10),
                  ),
                ]),
          )
        ],),
        // tab bar started

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Tabbutton(

                text: "LMP",
                pagenumber: 0,
                myselectedpage: _mySelectedpage,
                onPressed: () {
                  _onchangepage(0);
                },
              ),
              Tabbutton(
                text: "Ultrasound",
                pagenumber: 1,
                myselectedpage: _mySelectedpage,
                onPressed: () {
                  _onchangepage(1);

                },

              ),

              Tabbutton(
                text: "BMI",
                pagenumber: 2,
                myselectedpage: _mySelectedpage,
                onPressed: () {
                  _onchangepage(2);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>IncludedDrugScreen()));
                },
              ),
            ],
          ),
        ),

      ],),),

        body: Container(
         child: PageView(
           controller: _pageController,
           children: [
             LMP(name:'lmp page'),
             LMP(name:'Ultrasound'),
             LMP(name:'bmi calculattor'),
           ],
         ),
        ));
  }
}

class LMP extends StatefulWidget {
  String? name;
   LMP({this.name,Key? key}) : super(key: key);


  @override
  State<LMP> createState() => _LMPState();
}

class _LMPState extends State<LMP> {
  final calenderTextController=TextEditingController();
  String? age="2 weeks and 2 days",date="12/2/2022";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: scaffoldBgColor,
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
     child: Column(children: [
       Text(widget.name.toString()),
       SizedBox(height: 10.h,),


       MyTextField(size: size, textcontroller: calenderTextController, border: const OutlineInputBorder(
           borderSide: BorderSide(color: Colors.white, width: 1.0),),icon: Icons.calendar_today,),
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
}

