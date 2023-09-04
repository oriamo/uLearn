import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/utils/constants.dart';
import 'package:shop_app/common/utils/image_res.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/global.dart';
import 'package:shop_app/pages/sign_in/view/sign_in.dart';

import '../../../../common/widgets/text_widgets.dart';



class AppOnBoardingPage extends StatelessWidget {
  const AppOnBoardingPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }


}

Widget appOnboardingPage(PageController controller, BuildContext context,
    {String imagePath = ImageRes.reading, String title = "", String subTitile = "", index = 0}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Text16Normal(text: subTitile),
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
          child: Text16Normal(
              text: index < 3 ?"next" : "get started",
              color: Colors.white

          ),
        )
    ),
  );
}
