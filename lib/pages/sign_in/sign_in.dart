import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/button_widgets.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'package:shop_app/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:shop_app/pages/sign_in/sign_in_controller.dart';
import 'package:shop_app/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}


class _SignInState extends ConsumerState<SignIn> {
  //creating a variable for the sign in controller
  late SignInController _controller;
  @override
  void initState() {
    //initializing the sign in controller
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //log in buttons
                thridPartyLogin(),
                //more login options message
                Center(
                    child:
                        text14Normal(text: "or use your email account to login")),
                SizedBox(
                  height: 50.h,
                ),
                //text input fields

                //email text box
                appTextField(
                  text: "Email",
                  iconName: "user.png",
                  hintText: "enter your email",
                  obscureText: false,
                ),
                SizedBox(
                  height: 20.h,
                ),
                //password text box
                appTextField(
                  text: "password",
                  iconName: "lock.png",
                  hintText: "enter your password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: textUnderline(text: "forgot password?")),
                SizedBox(
                  height: 100.h,
                ),
                //app login button
                Center(
                  child: appButton(
                    buttonName: "Log In"
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                //app sign up button
                Center(
                  child: appButton(
                      buttonName: "Register",
                      isLogin: false,
                      context: context,
                      func: ()=>Navigator.pushNamed(context, "/signUp"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
