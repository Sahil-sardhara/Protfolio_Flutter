part of '../services.dart';

class _ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const _ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        setState(() => isHover = isHovering);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        // Lift effect for Desktop and Mobile
        transform: isHover
            ? (Matrix4.identity()
              ..translate(0, -10, 0)
              ..scale(1.05))
            : Matrix4.identity(),
        width: Responsive.isTablet(context) ? 400 : 300,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : theme.serviceCard,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHover
              ? [primaryColorShadow.copyWith(blurRadius: 20, spreadRadius: 2)]
              : [blackColorShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Essential for mobile stability
          children: [
            AnimatedScale(
              scale: isHover ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                widget.service.icon,
                height: 60,
              ),
            ),
            Space.y(3.w)!,
            Text(
              widget.service.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isHover ? whiteColor : theme.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Space.y(1.w)!,
            Text(
              widget.service.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isHover ? whiteColor.withOpacity(0.8) : theme.textColor,
                fontWeight: FontWeight.w200,
                fontSize: 13,
              ),
            ),
            // Replace your tool listing section with this:
            Space.y(2.w)!,
            Wrap(
              spacing: 20, // Horizontal space between the different tools
              runSpacing: 12, // Vertical space if they wrap to a new line
              alignment: WrapAlignment.center,
              children: widget.service.tool
                  .map((e) => Row(
                        mainAxisSize: MainAxisSize
                            .min, // Important: keeps logo and text together
                        children: [
                          // 1. The Logo on the Left
                          _buildToolIcon(e, isHover),

                          const SizedBox(
                              width: 8), // Small gap between logo and name

                          // 2. The Name on the Right
                          Text(
                            e,
                            style: TextStyle(
                              fontSize: 13,
                              color: isHover ? Colors.white : theme.textColor,
                              fontWeight:
                                  isHover ? FontWeight.w500 : FontWeight.w200,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

// --- ICON HELPER FUNCTION ---
  Widget _buildToolIcon(String toolName, bool isHovered) {
    final name = toolName.toLowerCase().trim();
    String assetName;

    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // 1. Move Android to the top so "java" doesn't trigger the web icon
    if (name.contains('android')) {
      assetName = 'android-icon.svg';
    } else if (name.contains('flutter')) {
      assetName = 'flutter.svg';
    } else if (name.contains('react')) {
      assetName =
          (isHovered || isDarkMode) ? 'React_dark.svg' : 'React_light.svg';
    } else if (name.contains('photoshop')) {
      assetName = 'photoshop.svg';
    } else if (name.contains('figma')) {
      assetName = 'figma.svg';
    } else if (name.contains('adobe')) {
      assetName = 'adobe.svg';
    } else if (name.contains('html') ||
        name.contains('css') ||
        name.contains('java')) {
      assetName = 'webdev.svg';
    } else {
      return const Text('⚡ ');
    }

    return SvgPicture.asset(
      'assets/icons/$assetName',
      height: 18, // Slightly bigger looks better on iPhone 17 Pro
      width: 18,
      // REMOVED colorFilter so icons keep their original color on hover
    );
  }
}
