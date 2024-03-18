
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            child: Column(
              children: [
                Text('Welcome Back', style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Sign in with your email and password \nor continue with socila media',
                  textAlign: TextAlign.center,
                ),
                SignForm(),
              ],
            ),
          ),
        )
    );
  }
}

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
          GFButton(
            onPressed: (){
              if(_formKey.currentState != null && _formKey.currentState!.validate()){
                _formKey.currentState!.save();
                // Perform actions after form submission
              }
            },
            text: "Continue",
            textStyle: TextStyle(fontSize: getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shape: GFButtonShape.pills,
            fullWidthButton: true,
            size: GFSize.LARGE,

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
        } else if (value.length < 8 && !errors.contains(kShortPassError)){
          setState(() {
            errors.add(kShortPassError);
          });
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
        );
  }
}





