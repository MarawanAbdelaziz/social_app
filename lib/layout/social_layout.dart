// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.title[cubit.currentIndex]),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.feed_rounded),
                label: 'Feeds',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_outlined),
                label: 'Chats',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Users',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}

      //!  verify your email
          // ConditionalBuilder(
          //   // ignore: unnecessary_null_comparison
          //   condition: cubit.model != null,
          //   builder: (context) {
          //     return Column(
          //       children: [
          //         //!  verify your email
          //         // if (!FirebaseAuth.instance.currentUser!.emailVerified)
          //         //   Container(
          //         //     color: Colors.amber.withOpacity(0.6),
          //         //     child: Padding(
          //         //       padding: const EdgeInsets.symmetric(horizontal: 10),
          //         //       child: Row(
          //         //         children: [
          //         //           const Icon(
          //         //             Icons.info_outline_rounded,
          //         //             size: 35,
          //         //             color: Colors.red,
          //         //           ),
          //         //           const SizedBox(width: 5.0),
          //         //           const Text('please verify your email'),
          //         //           const Spacer(),
          //         //           const SizedBox(
          //         //             width: 20.0,
          //         //           ),
          //         //           defaultButton(
          //         //             function: () {
          //         //               FirebaseAuth.instance.currentUser!
          //         //                   .sendEmailVerification()
          //         //                   .then((value) {
          //         //                 showtoast(
          //         //                   msg: 'check your mail',
          //         //                   states: ToastStates.success,
          //         //                 );
          //         //               }).catchError((error) {
          //         //                 showtoast(
          //         //                   msg: error.toString(),
          //         //                   states: ToastStates.error,
          //         //                 );
          //         //               });
          //         //             },
          //         //             text: 'send',
          //         //             width: 120,
          //         //             fontSize: 20,
          //         //             radius: 10,
          //         //           ),
          //         //         ],
          //         //       ),
          //         //     ),
          //         //   ),
          //       ],
          //     );
          //   },
          //   fallback: (context) =>
          //       const Center(child: CircularProgressIndicator()),
          // ),
         
         