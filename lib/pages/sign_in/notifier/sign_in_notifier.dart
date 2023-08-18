import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/pages/sign_in/notifier/sign_in_state.dart';
//the sign in notifier provides a globally available state of type SignInState
class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(const SignInState());


  void onUserEmailChanged(String email){
    state = state.copyWith(email: email);
  }


  void onUserPasswordChanged(String email){
    state = state.copyWith(email: email);
  }



}

final signInNotifierProvider = StateNotifierProvider((ref){
  return SignInNotifier();
});