
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';

Widget appButton({String buttonName = "", double height = 50, double width = 325, Color color = AppColors.primaryElement, Color textColor = AppColors.primaryBackground}){

  return GestureDetector(
    onTap: (){

    },
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
        color: color,
        border: Border.all(color: AppColors.primaryFourElementText)
      ),
      child: Center(
        child: text16Normal(
          text: buttonName,
          color: textColor,
        ),
      ),


    ),
  );
}