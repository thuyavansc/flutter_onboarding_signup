
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class SocialMediaCard extends StatelessWidget {
  final String icon;
  final Function press;
  const SocialMediaCard({
    super.key, required this.icon, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xfff5f6f9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}