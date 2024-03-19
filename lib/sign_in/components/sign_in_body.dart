
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_signup/sign_in/components/sign_form.dart';
import 'package:flutter_onboarding_signup/sign_in/components/social_media_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'custom_suffix_icon.dart';
import 'form_error.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(SizeConfig.screenHeight*0.04),
                  Text('Welcome Back', style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(getProportionateScreenWidth(20)),
                  Text('Sign in with your email and password \nor continue with socila media',
                    textAlign: TextAlign.center,
                  ),
                  Gap(getProportionateScreenWidth(30)),
                  SignForm(),
                  Gap(getProportionateScreenWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaCard(
                        icon: 'assets/icons/facebook-2.svg',
                        press: () {},
                      ),
                      SocialMediaCard(
                        icon: 'assets/icons/google-icon.svg',
                        press: () {},
                      ),
                      SocialMediaCard(
                        icon: 'assets/icons/X_logo_2023_original.svg',
                        press: () {},
                      ),
                    ],
                  ),
                  Gap(getProportionateScreenWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                      Text(
                        ' Sign Up',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}



