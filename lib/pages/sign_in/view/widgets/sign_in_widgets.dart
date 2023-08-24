import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/common/widgets/image_widgets.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';


Widget thridPartyLogin() {
  return Container(
    margin: EdgeInsets.only(right: 80.w, left: 80.w, top: 40.w, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("google.png"),
        _loginButton("apple.png"),
        _loginButton("facebook.png")
      ],
    ),
  );
}

Widget _loginButton(String imagepath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset("assets/icons/$imagepath"),
    ),
  );
}



