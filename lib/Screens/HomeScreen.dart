import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestationalage/Core/Constant/Colors.dart';
import 'package:gestationalage/Screens/View_Models/LMP_ViewModel.dart';
import 'package:masked_text/masked_text.dart';
import 'package:provider/provider.dart';

import 'BmiPage.dart';
import 'UiComponent/MyTextField.dart';
import 'UiComponent/NumberTextInputFormatter.dart';
import 'UiComponent/Tabbutton.dart';
import 'UltrsoundPage.dart';

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
     resizeToAvoidBottomInset:false,
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
             const UltrasoundPage(),
             const BmiPage()
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
  final _formKey = GlobalKey<FormState>();
  final calenderTextController=TextEditingController();
  String? age="2 weeks and 2 days",date="12/2/2022";
  String empty="";
  // var maskFormatter =  TextInputFormatter(
  //   //  mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')}
  // );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LMP_ViewModel>(

      builder: (context,lmpModel,child) {
        return

          Container(
            color: whiteBaground,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                   // height: size.height-260.h,
                    color: whiteBaground,
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                   child: Column(children: [


                     SizedBox(height: 10.h,),


                     Form(
                       key: _formKey,
                       child: MyTextField(size: size, textcontroller: lmpModel.lmpDateController, border: const OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.white, width: 1.0),),icon: Icons.calendar_today,text: "LMP Page" ,
                       onPres: (){
                         lmpModel. datePiker(context);
                       },
                         mxLenth: 10,
                         validator: (val) {
                           var date = val.toString().split("/");
                           print('date frist is ${date[0]}');
                           if (date[0].toString().compareTo("31")==1) {
                             return "wrong data";
                           }
                         },onChange: (val){
                         if(_formKey.currentState!.validate()){

                         }else{
                           print('is not valkidate');
                            }

                         },
                       ),
                     ),
                     SizedBox(height: 50.h,),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 10.sp),
                       decoration: BoxDecoration(
                           color: backgroundColor,
                           // border: Border.all(width: 1.w),
                           borderRadius: BorderRadius.circular(15.r)
                       ),
                       alignment: Alignment.center,
                       height: 150.h,
                       child: Column(children: [
                         SizedBox(height: 20.h,),
                         Row(children: [
                           SizedBox(height: 4.w,),
                           Text("Gestational age : ${lmpModel.week==0?empty:"${lmpModel.week} weeks ${lmpModel.days>0?"and":""}"}  ${lmpModel.days==0?empty:"${lmpModel.days}  days"} ")
                         ],),
                         SizedBox(height: 20.h,),
                         Row(children: [
                           SizedBox(height: 4.w,),
                           Text("Estimated Due Date (EDD) : ${lmpModel.eddDate??empty}"),
                         ],),
                         SizedBox(height: 20.h,),
                         Row(children: [
                           SizedBox(height: 4.w,),
                         Text("End of first trimester  : ${lmpModel.eddFirst1??empty}"),
                         ],),
                         SizedBox(height: 20.h,),
                         Row(children: [
                           SizedBox(height: 4.w,),
                           Text("Beginning of third trimester : ${lmpModel.eddFirst2??empty}"),
                         ],),
                       ],),
                     ),

                     RSizedBox.vertical(20.h),
                     /// Estimated featel weight container
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 10.sp),
                       decoration: BoxDecoration(
                           color: backgroundColor,
                           // border: Border.all(width: 1.w),
                           borderRadius: BorderRadius.circular(15.r)
                       ),
                       alignment: Alignment.center,
                       height: 120.h,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         Row(
                           //mainAxisSize:MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:  [
                             SizedBox(width: 28.w,),
                             Text.rich(TextSpan(
                               text: "Estimated featel weight for  ",
                               children: [
                                 TextSpan(text: "${lmpModel.week} weeks")
                               ]
                             )),



                           Spacer(),
                           CircleAvatar(
                             backgroundColor: primaryColor,
                             radius: Radius.circular(14.r).x,
                               child: CircleAvatar(
                                   backgroundColor: backgroundColor,
                                 radius: Radius.circular(12.r).x,
                                   child: Icon(Icons.question_mark_rounded,color: primaryColor,size: 20.sp,))),
                             SizedBox(width: 28.w,),
                           ],
                         ),
                         SizedBox(height: 20.h,),
                         Row(
                          // mainAxisSize:MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             const Text("Percentile "),
                             SizedBox(width: 10.w,),
                             const Text("3 "),
                             const Text("10 "),
                             const Text("50 "),
                             const Text("90 "),
                             const Text("97 "),
                           ],
                         ),
                         SizedBox(height: 20.h,),
                           Row(
                             // mainAxisSize:MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               const Text("Weight (g) "),
                               SizedBox(width: 10.w,),
                               const Text("3 "),
                               const Text("10 "),
                               const Text("50 "),
                               const Text("90 "),
                               const Text("97 "),
                             ],
                           ),

                       ],),
                     ),
                     RSizedBox.vertical(20.h),
                     Container(
                       decoration: BoxDecoration(
                           color: backgroundColor,
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
                  ),
                ),
                 //Spacer(),
                SizedBox(child: Image.asset("assets/images/buttomimg.png"),)
              ],
            ),

        );
      }
    );
  }
}

