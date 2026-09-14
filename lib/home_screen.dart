import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_assets.dart';
import 'package:flutter_application_1/custom_text_field.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/theme_cubit.dart';
import 'package:flutter_application_1/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    caseSensitive: false,
  );

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),

      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageUrl:
                  "https://cdn.dribbble.com/userupload/14381487/file/original-cec8fd1c7fc0b691082dd57d5da9d8a6.png",
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Form(
              key: formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                   Text(
                    'Sign in to SO',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        // side: const BorderSide(
                        //   color: Colors.white,
                        //   width: 2,
                        // ),
                        backgroundColor:Theme.of(context).colorScheme.primary,
                      ),

                      onPressed: () {
                        // Handle event button press
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://logo-teka.com/wp-content/uploads/2025/06/google-logo.png",
                            width: 24,
                            height: 24,
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            'Sign in with Google',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                       Text(
                        'Enter your email',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      CustomTextField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                'Password',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  // Forgot password action
                                },
                                child:  Text(
                                  'Forget?',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          CustomTextField(
                            controller: controller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 54,

                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                          ),

                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              
                            }
                          },

                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
  width: double.infinity,
  height: 54,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 16,
    children: [
      Text(
        'Don\'t have an account?',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),

      FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          // if (formKey.currentState!.validate()) {
             context.pushNamed(Routes.signUpScreen);
          // }
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),

BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, state) {
    return Switch(
      value: state.isDark,
      onChanged: (value) {
        context.read<ThemeCubit>().toggleTheme();
      },
    );
  },
),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}