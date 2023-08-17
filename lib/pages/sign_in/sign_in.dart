import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/button_widgets.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'package:shop_app/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: text12Underlined(text: "forgot password?")),
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
                    buttonName: "Sign Up",
                    color: AppColors.primaryBackground,
                    textColor: AppColors.primaryText,

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
