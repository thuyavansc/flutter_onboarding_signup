
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(errors.length, (index) => formErrorText(errors[index]))
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Error.svg', height: getProportionateScreenWidth(14), width: getProportionateScreenWidth(14),),
        Gap(getProportionateScreenWidth(10)),
        Text(error),
      ],
    );
  }
}