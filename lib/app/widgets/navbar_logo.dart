import 'package:flutter/material.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:sizer/sizer.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var textSty = TextStyle(
      color: theme.textColor,
      fontWeight: FontWeight.w100,
      // Scalable pixels (sp) ensure it looks right on M4 Mac and iPhone
      fontSize: Responsive.isDesktop(context) ? 12.sp : 10.sp,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      // Aligning items to the center keeps the brackets and name level
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("< ", style: textSty),
        Text(
          "Sahil",
          style: textSty.copyWith(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          Responsive.isDesktop(context) ? " />\t\t" : " />",
          style: textSty,
        )
      ],
    );
  }
}
