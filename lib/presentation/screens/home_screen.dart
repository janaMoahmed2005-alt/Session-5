import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/custom_text_field.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/data/data_source/Auth/auth_remote_data_source.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  bool isLoading = false;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        // TODO: Google sign-in
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  // TODO: Forgot password
                                },
                                child: Text(
                                  'Forget?',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomTextField(
                            controller: passwordController,
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
                          onPressed: isLoading
                              ? null
                              : () async {
                                  if (!formKey.currentState!.validate()) return;

                                  setState(() => isLoading = true);

                                  final result = await authService.login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );

                                  if (!mounted) return;
                                  setState(() => isLoading = false);

                                  if (result != null) {
                                    context.pushNamed(
                                      Routes.productScreen,
                                      queryParameters: {"title": "Product Screen"},
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Invalid email or password'),
                                      ),
                                    );
                                  }
                                },
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
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
                              "Don't have an account?",
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
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                context.pushNamed(Routes.signUpScreen);
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