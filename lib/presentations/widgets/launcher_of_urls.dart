import 'package:url_launcher/url_launcher.dart';

onLaunch(url, {mode = LaunchMode.externalApplication}) async {
  await launchUrl(Uri.parse(url), mode: mode);
}