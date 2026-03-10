class ProjectUtils {
  final String banners;
  final String icons;
  final String titles;
  final String description;
  final String links;
  ProjectUtils({
    required this.banners,
    required this.icons,
    required this.titles,
    required this.description,
    required this.links,
  });
}

List<ProjectUtils> projectUtils = [
  ProjectUtils(
    banners: 'assets/imgs/Project-1.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'AI ChatBot App',
    description:
        'A fully functional AI ChatBot app built with Flutter and Gemini API integration. It allows users to interact with an AI assistant for real-time responses. The source code is available below.',
    links: 'https://github.com/Sahil-sardhara/Ai_ChatBot',
  ),
  ProjectUtils(
    banners: 'assets/imgs/Project-2.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Uber Clone App',
    description:
        'This is an Uber Clone app built using Flutter, featuring ride booking UI, maps integration, and real-time functionality. Source code is available below.',
    links: 'https://github.com/Sahil-sardhara/uber_clone',
  ),
  ProjectUtils(
    banners: 'assets/imgs/Project-3.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Uber Driver App',
    description:
        'This is an Uber Driver app built using Flutter, allowing drivers to accept rides, view routes, and manage trips. Source code is available below.',
    links: 'https://github.com/Sahil-sardhara/uber_driver',
  ),
  ProjectUtils(
    banners: 'assets/imgs/04.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Awesome Plant App UI',
    description:
        'This is a just Plant App UI by using flutter, source code is also available, check below.',
    links: 'https://github.com/sudeshnb/flutter_plant_app.git',
  ),
];
