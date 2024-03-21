
import 'package:flutter/cupertino.dart';
import 'package:flutter_onboarding_signup/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_onboarding_signup/screens/login_success/login_success_screen.dart';
import 'package:flutter_onboarding_signup/screens/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
};