import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({Color color = AppColors.primaryElement,double radius = 15, double sr = 1,double br = 2 , BoxBorder? border}){

  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: sr,
        blurRadius: br,
        offset: Offset(0,1)
      )
    ]

  );
}


BoxDecoration appBoxDecorationTextField({Color color = AppColors.primaryBackground,double radius = 15, Color borderColor = AppColors.primaryFourElementText }){

  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor)
  );
}