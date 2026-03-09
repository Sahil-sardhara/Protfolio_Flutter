import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysite/app/sections/home/widgets/animation_text.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/animations/zoom_animation.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_html/html.dart' as html;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      // Padding ensures content never touches the screen edges
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      constraints: BoxConstraints(minHeight: 60.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background Animation (ZoomAnimations)
              Positioned(
                right: 0,
                bottom: 5.h,
                child: const EntranceFader(
                  offset: Offset(0, 0),
                  delay: Duration(seconds: 1),
                  duration: Duration(milliseconds: 800),
                  child: ZoomAnimations(),
                ),
              ),

              // Main Content
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hello Tag with Icon
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          hellotag,
                          style: AppText.h3!.copyWith(
                            fontSize: isFontSize(context, 18),
                          ),
                        ),
                        EntranceFader(
                          offset: const Offset(0, 0),
                          delay: const Duration(seconds: 2),
                          duration: const Duration(milliseconds: 800),
                          child: Image.asset(StaticImage.hi, height: 25.sp),
                        ),
                      ],
                    ),
                    Space.y(1.h)!,

                    // Name - Uses AutoSizeText logic or Wrap to prevent cut-off
                    Text(
                      yourname,
                      style: TextStyle(
                        fontSize: isFontSize(context, 38),
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // The "A [Animated Text]" Section - FIXED WITH WRAP
                    EntranceFader(
                      offset: const Offset(-10, 0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 800),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "A ",
                            style: TextStyle(
                              fontSize: isFontSize(context, 24),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          AnimatedTextKit(
                            animatedTexts: tabList,
                            isRepeatingAnimation: true,
                          ),
                        ],
                      ),
                    ),
                    Space.y(2.h)!,

                    // Description - Flexible width based on screen size
                    SizedBox(
                      width: Responsive.isDesktop(context) ? 50.w : 85.w,
                      child: Text(
                        miniDescription,
                        style: TextStyle(
                          fontSize: isFontSize(context, 16),
                          fontWeight: FontWeight.w100,
                          color: theme.textColor.withOpacity(0.6),
                        ),
                        softWrap: true,
                      ),
                    ),
                    Space.y(4.h)!,

                    // Resume Button
                    ColorChageButton(
                      text: 'download cv',
                      onTap: () async {
                        try {
                          // 1. Load the actual file from your app's assets (Bypasses Drive)
                          final ByteData data =
                              await rootBundle.load('assets/docs/Flutter_Resume.pdf');
                          final Uint8List bytes = data.buffer.asUint8List();

                          // 2. Create a Blob from the local bytes
                          final blob = html.Blob([bytes], 'application/pdf');

                          // 3. Create a temporary object URL
                          final url = html.Url.createObjectUrlFromBlob(blob);

                          // 4. Force Chrome to download it
                          final anchor = html.AnchorElement(href: url)
                            ..setAttribute("download", "Sahil_Sardhara_CV.pdf")
                            ..click();

                          // 5. Cleanup memory
                          html.Url.revokeObjectUrl(url);
                        } catch (e) {
                          // If the asset isn't found, only THEN fallback to the drive link
                          debugPrint(
                              "Asset not found, launching URL instead: $e");
                          html.window.open(resume, "_blank");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
