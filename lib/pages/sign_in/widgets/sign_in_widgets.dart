import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/common/widgets/image_widgets.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    leading: Container(
      child: const Icon(Icons.arrow_back_ios_new_sharp,
      color: Colors.black,),
    ),
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey,
        height: 1,
      ),
    ),
    title: text16Normal(text: "Login", color: AppColors.primaryText),
    shadowColor: Colors.transparent,
    centerTitle: true,
    surfaceTintColor: Colors.black,
  );
}

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

Widget appTextField(
    {String text = "",
    String iconName = "",
    String hintText = "insert your hint here",
    bool obscureText = false}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxDecorationTextField(),
          //row contains icons and text fields
          child: Row(
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17.w, right: 10.w),
                child: appImage(imagepath: iconName),
              ),

              //textfield
              Container(
                width: 260.w,
                height: 50.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      //this is the default border without any input
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      //this is the border when the text box is selected
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                  onChanged: (value) {},
                  maxLines: 1,
                  autocorrect: false,
                  //by default its false
                  obscureText: obscureText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
