import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/common/utils/image_res.dart';
import 'package:shop_app/pages/welcome/view/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/welcome_notifier.dart';






class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final index = ref.watch(indexDotProviderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // welcome pages
                PageView(
                  onPageChanged: (value){
                    ref.read(indexDotProviderProvider.notifier).changeIndex(value);

                  },
                  controller: _pageController,
                  children: [
                    //first page
                   appOnboardingPage(
                     _pageController,context,
                     imagePath: ImageRes.reading,
                     title: "First see learning",
                     subTitile: "forget about the paper now learing all in one place",
                     index : 1
                   ),
                    //Second page
                    appOnboardingPage(
                      _pageController, context,
                      imagePath: ImageRes.man,
                      title: "Connect with everyone",
                      subTitile: "Always keep in touch with your tutor and friends",
                      index : 2
                    ),
                    //third page
                    appOnboardingPage(
                      _pageController,context,
                      imagePath: ImageRes.boy,
                      title: "Always fascinated Learning",
                      subTitile: "always anytime. the time is set at your discretion. So Study wherever you can",
                      index : 3
                    )

                  ],
                ),
                //showing dots
                 Positioned(
                   bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: index,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size:  const Size.square(9.0),
                      activeSize: const Size(36.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w)
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
