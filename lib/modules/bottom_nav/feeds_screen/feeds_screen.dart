// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // ignore: unused_local_variable
        var cubit = SocialAppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.posts.isNotEmpty,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      const Image(
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/happy-professional-asian-female-manager-businesswoman-suit-showing-announcement-smiling-pointing-finger-left-product-project-banner-standing-white-background_1258-69508.jpg?t=st=1682620995~exp=1682621595~hmac=35b0846dce176294bd57b68440be96e3fc56d6b74f9cc36f2b22f04ba271188f'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 40,
                        ),
                        child: Text(
                          'Communicate with Friends',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildPostItem(cubit.posts[index], context),
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  itemCount: cubit.posts.length,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItem(PostModel model, context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      '${model.image}',
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.verified_rounded,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${model.dateTime}',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.grey,
                                    height: 1.3,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconBroken.More_Circle,
                      size: 30,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                '${model.text}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 5),
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         SizedBox(
              //           height: 20.0,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             minWidth: 1.0,
              //             padding: EdgeInsetsDirectional.only(end: 5),
              //             child: Text(
              //               '#software_development',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(color: Colors.blue),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             minWidth: 1.0,
              //             padding: EdgeInsetsDirectional.only(end: 5),
              //             child: Text(
              //               '#mobile_development',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(color: Colors.blue),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             minWidth: 1.0,
              //             padding: EdgeInsetsDirectional.only(end: 5),
              //             child: Text(
              //               '#flutter_development',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(color: Colors.blue),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //           width: 25.0,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             minWidth: 1.0,
              //             padding: EdgeInsetsDirectional.only(end: 5),
              //             child: Text(
              //               '#IT',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(color: Colors.blue),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20.0,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             minWidth: 1.0,
              //             padding: EdgeInsetsDirectional.only(end: 5),
              //             child: Text(
              //               '#agile',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall!
              //                   .copyWith(color: Colors.blue),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (model.postImage != '')
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${model.postImage}',
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                color: Colors.red,
                                size: 16,
                              ),
                              SizedBox(width: 3),
                              Text(
                                '0',
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
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconBroken.Chat,
                                color: Colors.orange,
                                size: 16,
                              ),
                              SizedBox(width: 3),
                              Text(
                                '0 comments',
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
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                              '${SocialAppCubit.get(context).userModel!.image}',
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Write a comment...',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey,
                                  height: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 18,
                          color: Colors.red,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Like',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.grey,
                                    height: 1.3,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Upload,
                          size: 18,
                          color: Colors.green,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Share',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.grey,
                                    height: 1.3,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      );
}
