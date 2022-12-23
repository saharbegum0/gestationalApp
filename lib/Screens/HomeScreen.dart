import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'UiComponent/Tabbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _mySelectedpage = 0;

  PageController? _pageController;

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
      appBar: AppBar(title: Column(children: [
        Row(children:  [
          SizedBox(child: Text("Gestational Age Calculate"),),SizedBox(width: 50,),
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
                  PopupMenuItem(
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
          padding: EdgeInsets.only(bottom: 3.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tabbutton(
                text: "BRANDS",
                pagenumber: 0,
                myselectedpage: _mySelectedpage,
                onPressed: () {
                  _onchangepage(0);
                },
              ),
              Spacer(),
              Tabbutton(
                text: "GENERIC",
                pagenumber: 1,
                myselectedpage: _mySelectedpage,
                onPressed: () {
                  _onchangepage(1);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>IncludedDrugScreen()));
                },
              ),
            ],
          ),
        ),

      ],),),

        body: Container(
          child: Column(children: [
          //  PopupMenuButton(itemBuilder: itemBuilder)
          ],),
        ));
  }
}
