part of '../main_section.dart';

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    var theme = Theme.of(context);
    
    // Check if we are on a mobile browser or a native app
    bool isMobileBrowser = SizerUtil.deviceType == DeviceType.mobile && kIsWeb;

    return Drawer(
      child: Material(
        color: theme.scaffoldBackgroundColor,
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                // Mobile Chrome needs less top space than the iPhone Notch
                top: isMobileBrowser ? 4.h : 8.h, 
                left: 2.w, 
                right: 2.w,
                bottom: 2.h,
              ),
              child: SingleChildScrollView( // Prevents overflow when keyboard or address bar appears
                child: Column(
                  children: [
                    const Center(child: NavBarLogo()),
                    const Divider(),
                    
                    // Theme Toggle
                    ListTile(
                      leading: Icon(
                        state.isDarkThemeOn
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode,
                      ),
                      title: Text(state.isDarkThemeOn ? "Light Mode" : "Dark Mode"),
                      trailing: Switch(
                        value: state.isDarkThemeOn,
                        activeThumbColor: theme.primaryColor,
                        onChanged: (newValue) {
                          context.read<ThemeCubit>().updateTheme(newValue);
                        },
                      ),
                    ),
                    const Divider(),

                    // Navigation Links
                    ...NavBarUtils.names.asMap().entries.map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                scrollProvider.jumpTo(e.key);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: Icon(NavBarUtils.icons[e.key]),
                                title: Text(e.value),
                              ),
                            ),
                          ),
                        ),
                    
                    // Resume Button stays close to the links
                    Space.y(2.h)!, 
                    ColorChageButton(
                      text: 'RESUME',
                      onTap: () {
                        openURL(resume);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}