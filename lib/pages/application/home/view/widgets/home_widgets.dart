import 'package:flutter/material.dart';

import '../../../../../common/utils/app_colors.dart';
import '../../../../../common/widgets/text_widgets.dart';
import '../../../../../global.dart';
Widget userName(){
  return Container(
    child: text24Normal(
      text: Global.storageService.getUserProfile().name!,
      fontweight: FontWeight.bold,
    ),
  );
}

Widget helloText(){
  return  Container(
    child: text24Normal(
      text: "Hello,",
      color: AppColors.primaryFourElementText,
      fontweight: FontWeight.bold,
    ),
  );

}