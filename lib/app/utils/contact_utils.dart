import 'package:mysite/changes/links.dart';

class ContactUtils {
  final String url;
  final String icon;

  ContactUtils({required this.url, required this.icon});
}

List<ContactUtils> contactUtils = [
  ContactUtils(
    url: gitHub,
    icon: "github",
  ),
  ContactUtils(
    url: linkedin,
    icon: "linkedin",
  ),
  ContactUtils(
    url: instagram,
    icon: "instagram",
  ),
];