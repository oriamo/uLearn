import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
    {String imagePath = "reading", String title = "", String subTitile = ""}) {
  return Column(
    children: [
      Image.asset(
        "assets/images/$imagePath.png",
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: Text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitile),
      ),
      _nextButton()
    ],
  );
}

Widget _nextButton() {
  return Container(width: 300, height: 70, color: Colors.red);
}
