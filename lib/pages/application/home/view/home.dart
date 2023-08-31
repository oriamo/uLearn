import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/utils/constants.dart';
import 'package:shop_app/common/widgets/app_bar.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'package:shop_app/global.dart';
import 'package:shop_app/pages/application/home/view/widgets/home_widgets.dart';

import '../../../../common/widgets/serach_widget.dart';
import '../controller/home_controller.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _contoller;

  @override
  void didChangeDependencies() {
    _contoller =  PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    //run a conditional check for the ascces token
    // Global.storageService.getUserProfile().access_token==null?const Text("user Auth Error"):
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h),
              serachBar(),
              SizedBox(height: 20.h,),
              HomeBanner(ref: ref, controller: _contoller),
              const homeMenuBar(),
            ],
          ),
        ),
      ),
    );
  }
}
