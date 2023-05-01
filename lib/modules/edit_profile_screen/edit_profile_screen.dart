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

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'UPDATE',
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
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
              ],
            ),
          ),
        );
      },
    );
  }
}
