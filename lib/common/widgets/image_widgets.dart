

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImage({String imagepath = "user.png", double width= 16 , double height = 16 }){
  
  return Image.asset(imagepath = "assets/icons/${imagepath.isEmpty?"user.png": imagepath}", width: width.w, height: height.h,);
}