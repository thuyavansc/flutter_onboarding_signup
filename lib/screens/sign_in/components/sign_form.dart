
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_signup/screens/login_success/login_success_screen.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import 'custom_suffix_icon.dart';
import 'form_error.dart';

class SignForm extends StatefulWidget {

  SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final List<String> errors = [];
  late bool remember =  false;


  @override
  Widget build(BuildContext context) {
    //errors.add('Please enter your email');

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          Gap(getProportionateScreenWidth(20)),
          buildPasswordFormField(),
          Gap(getProportionateScreenWidth(20)),
          FormError(errors: errors),
          Gap(getProportionateScreenWidth(20)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                //onTap: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
                onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                child: Text(
                  'Forget Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          GFButton(
            onPressed: (){
              if(_formKey.currentState != null && _formKey.currentState!.validate()){
                _formKey.currentState!.save();
                // Perform actions after form submission
                //if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
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

        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value){
        if(value!.isEmpty && !errors.contains(kPassNullError)){
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && !errors.contains(kShortPassError)){
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty && !errors.contains(kPassNullError)){
          setState(() {
            errors.add(kPassNullError);
          });
          return '';
        } else if (value.length < 8 && !errors.contains(kShortPassError)){
          setState(() {
            errors.add(kShortPassError);
          });
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg',),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return '';
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
    );
  }
}





