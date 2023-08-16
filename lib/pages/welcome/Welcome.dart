import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'package:shop_app/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              //first page
             appOnboardingPage(
               imagePath: "reading",
               title: "First see learning",
               subTitile: "forget about the paper now learing all in one place"
             ),
              //Second page
              appOnboardingPage(
                imagePath: "man",
                title: "Connect with everyone",
                subTitile: "Always keep in touch with your tutor and friends"
              ),
              //third page
              appOnboardingPage(
                imagePath: "boy",
                title: "Always fascinated Learning",
                subTitile: "always anytime. the time is set at your discretion. So Study wherever you can"
              )

            ],
          ),
          const Positioned(
            bottom: 100,
            left: 20,
            child: Text("widget one"),
          ),
        ],
      ),
    );
  }
}
