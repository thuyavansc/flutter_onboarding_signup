
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/login_success_body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_Success';
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Login Success'),
      ),
      body: LoginSuccessBody(),
    );
  }
}
