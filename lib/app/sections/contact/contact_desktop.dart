import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      child: Column(
        children: [
          const CustomSectionHeading(text: "\nGet in Touch"),
          Space.y(1.w)!,
          const CustomSectionSubHeading(
            text:
                "If you want to avail my services you can contact me at the links below.",
          ),
          Space.y(2.w)!,
          Container(
            padding: EdgeInsets.all(size.width * 0.05).copyWith(bottom: 10),
            decoration: BoxDecoration(
              gradient: theme.contactCard,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [blackColorShadow],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contactHeadding,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Space.y(1.w)!,
                          Text(
                            contactSubHeadding,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Space.y(2.w)!,
                        ],
                      ),
                    ),
                    const AnimatedGetStartedButton(),
                  ],
                ),
                Container(color: Colors.white.withOpacity(0.2), height: 1),
                Space.y(2.w)!,
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: contactUtils
                      .map((e) => AnimatedSocialIcon(iconData: e))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// --- SUPPORTING ANIMATED WIDGETS ---

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openURL(whatsapp),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          transform: _isHovered
              ? (Matrix4.identity()
                ..translate(0, -5, 0)
                ..scale(1.05))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            gradient: buttonGradi,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 2)
                  ]
                : [],
          ),
          child: const Text(
            'Get Started',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedSocialIcon extends StatefulWidget {
  final ContactUtils iconData;
  const AnimatedSocialIcon({Key? key, required this.iconData})
      : super(key: key);

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String assetPath;

    // Use a single chain to ensure only ONE path is chosen
    if (widget.iconData.icon.toLowerCase() == "github") {
      assetPath = isDarkMode
          ? "assets/icons/GitHub.svg"
          : "assets/icons/GitHub_light.svg";
    } else if (widget.iconData.icon == "linkedin") {
      assetPath = isDarkMode
          ? "assets/icons/linkedin.svg"
          : "assets/icons/linkedin_light.svg";
    } else if (widget.iconData.icon == "instagram") {
      assetPath = "assets/icons/instagram-icon.svg";
    } else {
      // This only runs if the icon is NOT github, linkedin, or instagram
      assetPath = "assets/icons/${widget.iconData.icon}.svg";
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openURL(widget.iconData.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          transform: _isHovered
              ? (Matrix4.identity()
                ..translate(0, -5, 0)
                ..scale(1.2))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color:
                _isHovered ? Colors.white.withOpacity(0.1) : Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                      blurRadius: 8,
                      spreadRadius: 1,
                    )
                  ]
                : [],
          ),
          child: SvgPicture.asset(
            assetPath,
            key: ValueKey(assetPath),
            height: 28,
            width: 28,
          ),
        ),
      ),
    );
  }
}
