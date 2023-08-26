import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/app_bar.dart';
import 'package:shop_app/common/widgets/app_shadow.dart';
import 'package:shop_app/pages/application/provider/application_nav_notifier.dart';
import 'package:shop_app/pages/application/widgets/widgets.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _State();
}

class _State extends ConsumerState<Application> {
  var index = 0 ;
  @override
  Widget build(BuildContext context) {
    var index = ref.watch(applicationNavIndexProvider);
    return Container(
      child: SafeArea(
        child: Scaffold(
         body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value){
                ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              items: bottomTabs,
              showSelectedLabels: false,
              showUnselectedLabels: false,


            ),
          ),

        ),
      ),
    );
  }
}
