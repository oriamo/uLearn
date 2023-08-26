import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/utils/constants.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/global.dart';
import 'package:shop_app/pages/sign_in/view/sign_in.dart';

import '../../../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(PageController controller, BuildContext context,
    {String imagePath = "reading", String title = "", String subTitile = "", index = 0}) {
  return Column(
    children: [
      Image.asset(
        "assets/images/$imagePath.png",
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitile),
      ),
      _nextButton(index, controller, context)
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index, duration: const Duration(milliseconds: 300),
            curve: Curves.linear);
      } else{
        //remember if we have gone through this welcome screen before
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);

        
         Navigator.pushNamed(context,
             "/signIn");
      }
    },
    child: Container(width: 325,
        height: 50,
        margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
        decoration: appBoxShadow(),
        child: Center(
          child: text16Normal(
              text: index < 3 ?"next" : "get started",
              color: Colors.white

          ),
        )
    ),
  );
}
