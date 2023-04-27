import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/layout_screens/chats_screen/chats_screen.dart';
import 'package:social_app/modules/layout_screens/home_screen/home_screen.dart';
import 'package:social_app/modules/layout_screens/settings_screen/settings_screen.dart';
import 'package:social_app/modules/layout_screens/users_screen/users_screen.dart';
import 'package:social_app/shared/cubit/states.dart';

import '../../models/user_moder.dart';
import '../components/constants.dart';

class SocialCubit extends Cubit<SocialAppStates> {
  SocialCubit() : super(InitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? model;

  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = UserModel.fromJson(value.data());
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }

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
