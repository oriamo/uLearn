import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/image_res.dart';

import '../../../../../common/utils/app_colors.dart';
import '../../../../../common/widgets/text_widgets.dart';
import '../../../../../global.dart';


Widget banner(){
  return Column(
    children: [
      //images
      SizedBox(
        width: 325.w,
        height: 160.h,
        child: PageView(
          children: [
            bannerContainer(imagepath: ImageRes.banner1),
            bannerContainer(imagepath: ImageRes.banner2),
            bannerContainer(imagepath: ImageRes.banner3),


          ],
        ),

      ),
      //dots

    ],
  );
}

Widget bannerContainer({String imagepath = ImageRes.banner1}){

  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagepath),
        fit: BoxFit.fill
      )
    ),

  );
}

Widget userName(){
  return Container(
    child: text24Normal(
      text: Global.storageService.getUserProfile().name!,
      fontweight: FontWeight.bold,
    ),
  );
}

Widget helloText(){
  return  Container(
    child: text24Normal(
      text: "Hello,",
      color: AppColors.primaryFourElementText,
      fontweight: FontWeight.bold,
    ),
  );

}