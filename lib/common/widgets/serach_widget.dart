import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/utils/image_res.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/common/widgets/app_textfields.dart';
import 'package:shop_app/common/widgets/image_widgets.dart';

Widget serachBar(){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //serch text box Container
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)

        ),

        child: Row(
          children: [
            //icon container
            Container(
              child: appImage(imagePath: ImageRes.searchIcon),
              margin: EdgeInsets.only(left: 17.w),
            ),
            //text field container
            SizedBox(
              width: 230.w,
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.only(top: 11.h),
                child: appTextFieldOnly(width: 230, height: 40, hintText: "search for a course"),
              ),

            )
          ],
        ) ,

      ),
      //search text button
      GestureDetector(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.all(5),
          width: 40.w,
          height: 40.h,
          decoration: appBoxShadow(
            boxBorder: Border.all(color: AppColors.primaryElement),

          ),
          child: appImage(imagePath: ImageRes.searchButton),

        ),

      ),

    ],

  );
}