import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/layout_screens/chats_screen/chats_screen.dart';
import 'package:social_app/modules/layout_screens/home_screen/home_screen.dart';
import 'package:social_app/modules/layout_screens/settings_screen/settings_screen.dart';
import 'package:social_app/modules/layout_screens/users_screen/users_screen.dart';
import 'package:social_app/shared/cubit/states.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(InitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeCurrentIndexStates());
  }

  List<Widget> screen = [
    const HomeScreen(),
    const ChatsScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  List<String> title = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];
}
