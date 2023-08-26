import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField({
  String text = "",
  String iconName = "",
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
  TextInputType textInputType = TextInputType.multiline,
  TextEditingController? controller,
}) {
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
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          //row contains icon and textfield
          child: Row(
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              //our text field
              Container(
                width: 260.w,
                height: 50.h,
                child: TextField(
                  onChanged: (value) {
                    if (func != null) {
                      func(value);
                    }
                  },
                  controller: controller,
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    //default border without any input
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    //focused border is with input
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),

                  maxLines: 1,
                  autocorrect: false,
                  //by defualt it's false
                  obscureText: obscureText,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly({
  String hintText = "",
  double width = 200,
  double height = 50,
  TextEditingController? controller,
  Void Function(String value)? func,
  bool obscureText = false,
  TextInputType textInputType = TextInputType.multiline,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: TextField(
      onChanged: (value) {
        if (func != null) {
          func(value);
        }
      },
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //default border without any input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //focused border is with input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      maxLines: 1,
      autocorrect: false,
      //by defualt it's false
      obscureText: obscureText,
    ),
  );
}
