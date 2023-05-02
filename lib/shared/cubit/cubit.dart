// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/user_moder.dart';
import 'package:social_app/modules/bottom_nav/chats_screen/chats_screen.dart';
import 'package:social_app/modules/bottom_nav/feeds_screen/feeds_screen.dart';
import 'package:social_app/modules/new_post/new_post_screen.dart';
import 'package:social_app/modules/bottom_nav/settings_screen/settings_screen.dart';
import 'package:social_app/modules/bottom_nav/users_screen/users_screen.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialAppCubit extends Cubit<SocialAppStates> {
  SocialAppCubit() : super(InitailState());

  static SocialAppCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      if (value.data() != null) {
        userModel = UserModel.fromJson(value.data()!);
        emit(GetUserSuccessState());
      } else {
        emit(GetUserErrorState('Data is Null'));
        print('Data is Null');
      }
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
      print(error.toString());
    });
  }

  int currentIndex = 0;
  void changeCurrentIndex(index) {
    if (index == 2) {
      emit(NewPostState());
    } else {
      currentIndex = index;

      emit(ChangeBottomNavState());
    }
  }

  List<Widget> screen = [
    const FeedsScreen(),
    const ChatsScreen(),
    const NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  List<String> title = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      emit(ProfileImagePickedSuccessState());
      profileImage = File(pickedFile!.path);
    } else {
      print('No image selected.');
      emit(ProfileImagePickedErrorState());
    }
  }

  File? coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      emit(CoverImagePickedSuccessState());
      coverImage = File(pickedFile!.path);
    } else {
      print('No image selected.');
      emit(CoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUploadLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) => {
              value.ref.getDownloadURL().then((value) {
                updateUser(
                  name: name,
                  phone: phone,
                  bio: bio,
                  profile: value,
                );
              }).catchError((error) {
                UploadProfileImageErrorState();
                return error;
              })
            })
        .catchError((error) {
      UploadProfileImageErrorState();
      return error;
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUploadLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) => {
              value.ref.getDownloadURL().then((value) {
                updateUser(
                  name: name,
                  phone: phone,
                  bio: bio,
                  cover: value,
                );
              }).catchError((error) {
                UploadCoverImageErrorState();
                return error;
              })
            })
        .catchError((error) {
      UploadCoverImageErrorState();
      return error;
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? profile,
    String? cover,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel!.email,
      image: profile ?? userModel!.image,
      cover: cover ?? userModel!.cover,
      uId: userModel!.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UserUploadErrorState());
    });
  }
}
