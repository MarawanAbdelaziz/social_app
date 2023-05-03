// ignore_for_file: must_be_immutable, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialAppCubit.get(context).userModel!;
        var profileImage = SocialAppCubit.get(context).profileImage;
        var coverImage = SocialAppCubit.get(context).coverImage;

        nameController.text = userModel.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              TextButton(
                onPressed: () {
                  SocialAppCubit.get(context).updateUser(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text,
                  );
                },
                child: const Text(
                  'UPDATE',
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (state is UserUploadLoadingState)
                    const LinearProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  if (state is UserUploadLoadingState)
                    const SizedBox(height: 10),
                  SizedBox(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage('${userModel.cover}')
                                        : FileImage(coverImage)
                                            as ImageProvider<Object>,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  SocialAppCubit.get(context).getCoverImage();
                                },
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 20,
                                  ),
                                ),
                              ),
                    
                            ],
                          ),
                     ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${userModel.image}')
                                    : FileImage(profileImage)
                                        as ImageProvider<Object>?,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                SocialAppCubit.get(context).getProfileImage();
                              },
                              icon: const CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (SocialAppCubit.get(context).profileImage != null ||
                      SocialAppCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (SocialAppCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                  function: () {
                                    SocialAppCubit.get(context)
                                        .uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  },
                                  text: 'upload Profile',
                                  radius: 8,
                                ),
                                if (state is UserUploadLoadingState)
                                  const SizedBox(height: 5),
                                if (state is UserUploadLoadingState)
                                  const LinearProgressIndicator(
                                    color: Colors.black,
                                    backgroundColor: Colors.white,
                                  ),
                              ],
                            ),
                          ),
                        const SizedBox(width: 5),
                        if (SocialAppCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                  function: () {
                                    SocialAppCubit.get(context)
                                        .uploadCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  },
                                  text: 'upload Cover',
                                  radius: 5,
                                ),
                                if (state is UserUploadLoadingState)
                                  const SizedBox(height: 5),
                                if (state is UserUploadLoadingState)
                                  const LinearProgressIndicator(
                                    color: Colors.black,
                                    backgroundColor: Colors.white,
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  if (SocialAppCubit.get(context).profileImage != null ||
                      SocialAppCubit.get(context).coverImage != null)
                    const SizedBox(height: 20),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Pleas don\'t leave empty';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: IconBroken.User,
                  ),
                  const SizedBox(height: 10),
                  defaultFormField(
                    controller: bioController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Pleas don\'t leave empty';
                      }
                      return null;
                    },
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Pleas don\'t leave empty';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone_android,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
