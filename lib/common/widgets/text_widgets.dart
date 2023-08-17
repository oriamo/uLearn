import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';

Widget Text24Normal({String text = "", Color color = AppColors.primaryText}){


  return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.normal
      )
  );

  }

Widget text16Normal({String text = "", Color color = AppColors.primarySecondaryElementText}){


  return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.normal
      )
  );

}

Widget text14Normal({String text = "", Color color = AppColors.primaryThreeElementText}){


  return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.normal
      )
  );

}

Widget text12Underlined({String text = "", Color color = AppColors.primaryText}){


  return GestureDetector(
    onTap: (){

    },
    child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: color,
        )
    ),
  );

}