import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/image_res.dart';
import 'package:shop_app/common/widgets/image_widgets.dart';

import '../../../common/utils/app_colors.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon:_bottomContainer(color: AppColors.primaryElement),
      label: "Home"
  ),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.search),
      activeIcon:_bottomContainer(imagePath: ImageRes.search,color: AppColors.primaryElement),
      label: "Search",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.play),
    activeIcon:_bottomContainer(imagePath: ImageRes.play,color: AppColors.primaryElement),
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.message),
    activeIcon:_bottomContainer(imagePath: ImageRes.message,color: AppColors.primaryElement),
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.person),
    activeIcon:_bottomContainer(imagePath: ImageRes.person,color: AppColors.primaryElement),
    label: "Search",
  ),

];

Widget _bottomContainer(
    {double width = 15, double height = 15, String imagePath = ImageRes.home, Color color = AppColors.primaryFourElementText}) {
  return SizedBox(
    width: 15.w,
    height: 15.h,
    child: appImageWithColor(
        imagePath: imagePath, color: color),
  );
}

Widget appScreens({int index = 0}){
  List<Widget> screens= [
    Center(child: appImage(imagePath: ImageRes.home),),
    Center(child: appImage(imagePath: ImageRes.search),),
    Center(child: appImage(imagePath: ImageRes.play),),
    Center(child: appImage(imagePath: ImageRes.message),),
    Center(child: appImage(imagePath: ImageRes.person),),

  ];
  return screens[index];

}