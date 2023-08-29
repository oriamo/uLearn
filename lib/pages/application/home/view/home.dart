import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/utils/constants.dart';
import 'package:shop_app/common/widgets/app_bar.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'package:shop_app/global.dart';
import 'package:shop_app/pages/application/home/view/widgets/home_widgets.dart';

import '../../../../common/widgets/serach_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //run a conditional check for the ascces token
    // Global.storageService.getUserProfile().access_token==null?const Text("user Auth Error"):
    return Scaffold(
      appBar: buildAppbar(title: "Home"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              helloText(),
              userName(),
              SizedBox(height: 20.h),
              serachBar(),
              SizedBox(height: 20.h,),
              banner(),




            ],
          ),
        ),
      ),
    );
  }
}
