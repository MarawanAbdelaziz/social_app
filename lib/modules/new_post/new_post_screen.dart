// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});
  var textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              TextButton(
                onPressed: () {
                  var now = DateTime.now();

                  if (cubit.postImage == null) {
                    cubit.createPost(
                      dateTime: now.toString(),
                      text: textcontroller.text,
                    );
                  } else {
                    cubit.uploadPostImage(
                      dateTime: now.toString(),
                      text: textcontroller.text,
                    );
                  }
                },
                child: const Text(
                  'POST',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is CreatePostLoadingState)
                  const LinearProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                if (state is CreatePostLoadingState)
                  const SizedBox(height: 10.0),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://as1.ftcdn.net/v2/jpg/03/56/68/96/1000_F_356689689_nv13vuFrYK3rAQospF6BogUa9uXm2KBf.jpg'),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Marawan Abd EL-Aziz',
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'public',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: Colors.grey,
                                  height: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'what is on your mind, Marawan?',
                      hintStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.grey,
                              ),
                    ),
                  ),
                ),
                if (cubit.postImage != null)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              image: DecorationImage(
                                image: FileImage(cubit.postImage!),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.removePostImage();
                            },
                            icon: const CircleAvatar(
                              radius: 20.0,
                              child: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          cubit.getpostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(IconBroken.Image),
                            SizedBox(width: 5),
                            Text('add photos'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('# tags'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
