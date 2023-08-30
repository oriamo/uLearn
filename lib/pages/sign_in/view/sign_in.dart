import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/loader/global_loader.dart';
import 'package:shop_app/common/utils/app_colors.dart';
import 'package:shop_app/common/widgets/button_widgets.dart';
import 'package:shop_app/common/widgets/text_widgets.dart';
import 'package:shop_app/pages/sign_in/controller/sign_in_controller.dart';
import 'package:shop_app/pages/sign_in/view/widgets/sign_in_widgets.dart';

import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';
import '../provider/sign_in_notifier.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  //creating a variable for the sign in controller
  late SignInController _controller;


  @override
  void didChangeDependencies(){
    _controller = SignInController();

    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    var loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(),
            body: loader == true
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      color: AppColors.primaryElement,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //log in buttons
                        thridPartyLogin(),
                        //more login options message
                        const Center(
                            child: Text14Normal(
                                text: "or use your email account to login")),
                        SizedBox(
                          height: 50.h,
                        ),
                        //text input fields

                        //email text box
                        AutofillGroup(
                          child: Column(
                            children: [
                              appTextField(
                                  controller: _controller.emailController,
                                  text: "Email",
                                  iconName: ImageRes.user,
                                  hintText: "enter your email",
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
                                  func: (value) {
                                    ref
                                        .read(signInNotifierProvider.notifier)
                                        .onUserEmailChanged(value);
                                  },
                                autoFillHints: [AutofillHints.email],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              appTextField(
                                  controller: _controller.passwordController,
                                  text: "password",
                                  iconName: ImageRes.lock,
                                  hintText: "enter your password",
                                  obscureText: true,
                                  func: (value) {
                                    ref
                                        .read(signInNotifierProvider.notifier)
                                        .onUserPasswordChanged(value);
                                  },
                                  autoFillHints: [AutofillHints.password]
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 25.w),
                            child: const TextUnderline(text: "forgot password?")),
                        SizedBox(
                          height: 100.h,
                        ),
                        //app login button
                        Center(
                          child: appButton(
                              buttonName: "Log In",
                              func: () {
                                _controller.handelSignIn(ref);
                              }),
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
                                func: () =>
                                    Navigator.pushNamed(context, "/signUp"))),
                      ],
                    ),
                  )),
      ),
    );
  }
}
