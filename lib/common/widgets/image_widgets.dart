import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImage(
    {String imagePath = "user.png",
    double width = 16,
    double height = 16}) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png" : "assets/icons/$imagePath",
    width: width.w,
    height: height.h,
  );
}
