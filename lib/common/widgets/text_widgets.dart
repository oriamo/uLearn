import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../utils/app_colors.dart';

Widget text24Normal({String text = "", Color color = AppColors.primaryText, FontWeight fontweight = FontWeight.normal}) {


  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24.sp, fontWeight: fontweight),
  );
}


class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text16Normal({super.key, this.text = "", this.color = AppColors.primarySecondaryElementText, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16.sp, fontWeight: fontWeight),
    );
  }


}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text10Normal({super.key, this.text = "", this.color = AppColors.primaryThreeElementText, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 10.sp, fontWeight: fontWeight),
    );
  }
}
class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text11Normal({super.key, this.text = "", this.color = AppColors.primaryElementText, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 11.sp, fontWeight: fontWeight),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text14Normal({super.key, this.text = "", this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(color: color, fontSize: 14.sp, fontWeight: FontWeight.normal),
    );
  }


}

class TextUnderline extends StatelessWidget {
  final String text;
  const TextUnderline({super.key, this.text = "your text"});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child:  Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,

        ),
      ),
    );
  }


}
