import 'package:flutter/material.dart';
import 'package:mysite/app/sections/contact/contact_desktop.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
// Remove the 'as theme' import to avoid confusion
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentTheme = Theme.of(context);
    return Column(
      children: [
        Space.y(10.w)!,
        CustomSectionHeading(text: contactHeadding),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: contactSubHeadding),
        ),
        Space.y(5.w)!,
        const AnimatedGetStartedButton(),
        Space.y(10.w)!,
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children:
              contactUtils.map((e) => AnimatedSocialIcon(iconData: e)).toList(),
        ),
        Space.y(5.w)!,
        Container(color: Colors.white.withOpacity(0.2), height: 1),
      ],
    );
  }
}

class AnimatedGetStartedButton extends StatefulWidget {
  const AnimatedGetStartedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedGetStartedButton> createState() =>
      _AnimatedGetStartedButtonState();
}

class _AnimatedGetStartedButtonState extends State<AnimatedGetStartedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Access primaryColor directly from your colors.dart or via Theme
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () => openURL(whatsapp),
      onHover: (value) => setState(() => _isHovered = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.center, // Keeps the text centered
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
        transform: _isHovered
            ? (Matrix4.identity()
              ..translate(0, -5, 0)
              ..scale(1.05)) // Lift and Scale
            : Matrix4.identity(),
        decoration: BoxDecoration(
          gradient: buttonGradi,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.4),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: Text(
          'Get Started',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black, // Force black for contrast on the gradient
          ),
        ),
      ),
    );
  }
}
