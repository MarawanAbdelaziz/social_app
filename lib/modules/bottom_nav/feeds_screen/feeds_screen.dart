// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 15.0,
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
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
        ),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 15.0,
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://as1.ftcdn.net/v2/jpg/03/56/68/96/1000_F_356689689_nv13vuFrYK3rAQospF6BogUa9uXm2KBf.jpg'),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Marawan Abd EL-Aziz',
                                style: TextStyle(
                                  height: 1.2,
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
                            'April 29, 2023 at 7:00 pm',
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
