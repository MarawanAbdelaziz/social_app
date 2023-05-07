// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/auth/login_screen/login_screen.dart';
import 'package:social_app/modules/auth/register_screen/cubit/cubit.dart';
import 'package:social_app/modules/auth/register_screen/cubit/states.dart';

import '../../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  bool isPressed = true;

  var formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // if (state is RegisterErrorState) {
          //   showtoast(msg: state.error, states: ToastStates.error);
          // }
          if (state is CreateUserSuccessState) {
            navigateAndFinish(context, LoginScreen());
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Center(
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please don\'t let me empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(height: 40.0),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please don\'t let me empty';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(height: 40.0),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please don\'t let me empty';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone_android_outlined,
                        ),
                        const SizedBox(height: 40.0),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please don\'t let me empty';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            if (formkey.currentState!.validate()) {
                              cubit.userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          label: 'Password',
                          isPassword: cubit.isPassword,
                          prefix: Icons.key,
                          suffix: cubit.suffix,
                          suffixPressed: () {
                            isPressed = !isPressed;
                            cubit.changePasswordVisibility();
                          },
                        ),
                        const SizedBox(height: 50.0),
                        ConditionalBuilder(
                          condition: state is! RegisterLodaingState,
                          builder: (context) => Center(
                            child: defaultButton(
                              function: () {
                                if (formkey.currentState!.validate()) {
                                  cubit.userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              text: 'Register',
                              background: Colors.black,
                              radius: 20.0,
                              width: 230.0,
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
