// ignore_for_file: avoid_print

import 'package:social_app/modules/auth/login_screen/login_screen.dart';
import 'package:social_app/shared/components/components.dart';

import '../network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: "token").then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token = '';
String? uId = '';
