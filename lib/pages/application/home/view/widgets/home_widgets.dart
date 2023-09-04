import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/image_res.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/common/widgets/image_widgets.dart';
import 'package:shop_app/pages/application/home/controller/home_controller.dart';

import '../../../../../common/utils/app_colors.dart';
import '../../../../../common/widgets/text_widgets.dart';
import '../../../../../global.dart';



class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;

  const HomeBanner({
    super.key,
    required this.ref,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //images
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagepath: ImageRes.banner1),
              bannerContainer(imagepath: ImageRes.banner2),
              bannerContainer(imagepath: ImageRes.banner3),
            ],
          ),
        ),
        //dots

        DotsIndicator(
          dotsCount: 3,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(36.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
            ),
          ),
          position: ref.watch(homeScreenBannerDotsProvider),
        ),
      ],
    );
  }
}

Widget banner({required WidgetRef ref, required PageController controller}) {
  return Column(
    children: [
      //images
      SizedBox(
        width: 325.w,
        height: 160.h,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
          },
          children: [
            bannerContainer(imagepath: ImageRes.banner1),
            bannerContainer(imagepath: ImageRes.banner2),
            bannerContainer(imagepath: ImageRes.banner3),
          ],
        ),
      ),
      //dots

      DotsIndicator(
        dotsCount: 3,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(36.0, 8.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.w),
          ),
        ),
        position: ref.watch(homeScreenBannerDotsProvider),
      ),
    ],
  );
}

Widget bannerContainer({String imagepath = ImageRes.banner1}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagepath), fit: BoxFit.fill)),
  );
}

Widget userName() {
  return Container(
    child: text24Normal(
      text: Global.storageService.getUserProfile().name!,
      fontweight: FontWeight.bold,
    ),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontweight: FontWeight.bold,
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: "Hello,",
        color: AppColors.primaryFourElementText,
        fontweight: FontWeight.bold,
      ),
    );
  }
}

AppBar homeAppbar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(imagePath: ImageRes.menu),
          GestureDetector(
            child: const AppBoxDecorationImage()
          )
        ],
      ),
    ),
  );
}


class homeMenuBar extends StatelessWidget {
  const homeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //course selection
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end ,
            children: [
              Container(
                child: const Text16Normal(text: "choose your course", color: AppColors.primaryText, fontWeight: FontWeight.bold,),
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "see all",
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Container(
          child: Row(
            children: [
              Container(
                decoration: appBoxShadow(
                  color: AppColors.primaryElement,
                  radius: 7.w
                ),
                padding: EdgeInsets.only(left: 15.w , right: 15.w , top: 5.h , bottom: 5.h ),
                child: const Text11Normal(text: "All"),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                  text: "popular",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                  text: "newest",
                  color: AppColors.primaryThreeElementText,
                ),
              )

            ],
          ),
        )


      ],
    );
  }


}
