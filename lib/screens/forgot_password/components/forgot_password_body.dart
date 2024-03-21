
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_signup/size_config.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import '../../../constants.dart';
import '../../sign_in/components/custom_suffix_icon.dart';
import '../../sign_in/components/form_error.dart';
import '../../sign_in/components/no_account_text.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Gap(SizeConfig.screenHeight*0.04),
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Please enter your email and we will send\n you a link to return to your account',
                textAlign: TextAlign.center,
              ),
              Gap(SizeConfig.screenHeight*0.1),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}


class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue!,
          onChanged: (value){
            if(value.isNotEmpty && errors.contains(kEmailNullError)){
              setState(() {
                errors.remove(kEmailNullError);
              });
            } else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
            return null;
          },
          validator: (value) {
            if(value!.isEmpty && !errors.contains(kEmailNullError)){
              setState(() {
                errors.add(kEmailNullError);
              });
            } else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
              setState(() {
                errors.add(kInvalidEmailError);
              });
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg',),
            errorText: errors.contains(kEmailNullError) ? kEmailNullError : null,
          ),
        ),
          Gap(getProportionateScreenHeight(30)),
          FormError(errors:errors),
          Gap(SizeConfig.screenHeight*0.1),
          GFButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                // Perform actions after form submission
              }
            },
            text: "Continue",
            textStyle: TextStyle(fontSize: getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shape: GFButtonShape.pills,
            fullWidthButton: true,
            size: GFSize.LARGE,
            color: kGreenTealColor,

          ),
          Gap(SizeConfig.screenHeight*0.1),
          NoAccountText(),
        ],
      ),

    );
  }
}
