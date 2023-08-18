import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/sign_up/sign_up_controller.dart';
import '../../common/loader/global_loader.dart';
import '../../common/utils/app_colors.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';
import '../../common/widgets/button_widgets.dart';
import '../../common/widgets/text_widgets.dart';
import '../sign_in/widgets/sign_in_widgets.dart';
import 'notifier/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    //regProvider.
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(title: "Sign up"),
            backgroundColor: Colors.white,
            body: loader == false
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        //more login options message
                        Center(
                            child: text14Normal(
                                text:
                                    "Enter your details below & free sign up")),
                        SizedBox(
                          height: 20.h,
                        ),
                        //user name text box
                        appTextField(
                          text: "User name",
                          iconName: "user.png",
                          hintText: "Enter your user name",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserNameChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //email text box
                        appTextField(
                          text: "Email",
                          iconName: "user.png",
                          hintText: "Enter your email address",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserEmailChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //password text box
                        appTextField(
                          text: "Password",
                          iconName: "lock.png",
                          hintText: "Enter your password",
                          obscureText: true,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserPasswordChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //password text box
                        appTextField(
                            text: "Confirm your password",
                            iconName: "lock.png",
                            hintText: "Confirm your password",
                            func: (value) => ref
                                .read(registerNotifierProvider.notifier)
                                .onUserRePasswordChange(value),
                            obscureText: true),
                        SizedBox(
                          height: 20.h,
                        ),
                        //forgot text
                        Container(
                            margin: EdgeInsets.only(left: 25.w),
                            child: text14Normal(
                                text:
                                    "By creating an account you are agreeing with our terms and conditions")),
                        SizedBox(
                          height: 50.h,
                        ),

                        Center(
                            child: appButton(
                                buttonName: "Register",
                                isLogin: true,
                                context: context,
                                func: () => _controller.handleSignUp()))
                        //app register button
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      color: AppColors.primaryElement,
                    ),
                  )),
      ),
    );
  }
}
