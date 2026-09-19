import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_application_1/auth_service.dart';
//import 'package:flutter_application_1/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // =========================
  // Form Key
  // =========================

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // =========================
  // Controllers
  // =========================

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController firstNameController =
      TextEditingController();

  final TextEditingController lastNameController =
      TextEditingController();

  // =========================
  // Auth Service
  // =========================

  final AuthService authService = AuthService();

  // =========================
  // Loading
  // =========================

  bool isLoading = false;

  // =========================
  // Dispose
  // =========================

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();

    super.dispose();
  }

  // =========================
  // Build
  // =========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                // =========================
                // Title
                // =========================

                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // =========================
                // First Name
                // =========================

                TextFormField(
                  controller: firstNameController,

                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.tertiary,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your first name';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // =========================
                // Last Name
                // =========================

                TextFormField(
                  controller: lastNameController,

                  decoration: InputDecoration(
                    hintText: 'Enter your last name',
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.tertiary,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your last name';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // =========================
                // Email
                // =========================

                TextFormField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.tertiary,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    final emailRegExp = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    );

                    if (!emailRegExp.hasMatch(
                      value.trim(),
                    )) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // =========================
                // Password
                // =========================

                TextFormField(
                  controller: passwordController,

                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.tertiary,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                // =========================
                // Continue Button
                // =========================

                SizedBox(
                  height: 50,

                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            // =========================
                            // Validate
                            // =========================

                            if (!formKey.currentState!
                                .validate()) {
                              return;
                            }

                            // =========================
                            // Start Loading
                            // =========================

                            setState(() {
                              isLoading = true;
                            });

                            try {
                              // =========================
                              // Register User
                              // =========================

                              final success =
                                  await authService.register(
                                email:
                                    emailController.text.trim(),
                                password:
                                    passwordController.text,
                                firstName:
                                    firstNameController.text.trim(),
                                lastName:
                                    lastNameController.text.trim(),
                              );

                              if (!mounted) return;

                              // =========================
                              // Registration Successful
                              // =========================

                              if (success) {
                                print('ACCOUNT CREATED');

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Account created successfully. Check your email for the verification code.',
                                    ),
                                  ),
                                );

                                // =========================
                                // Go To Verification Screen
                                // =========================

                                context.pushNamed(
                                  Routes.verificationScreen,
                                  queryParameters: {
                                    'email':
                                        emailController.text.trim(),
                                  },
                                );
                              }

                              // =========================
                              // Registration Failed
                              // =========================

                              else {
                                print(
                                  'ACCOUNT CREATION FAILED',
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Registration failed. Please try again.',
                                    ),
                                  ),
                                );
                              }
                            }

                            // =========================
                            // Other Error
                            // =========================

                            catch (e) {
                              if (!mounted) return;

                              print(
                                'SIGN UP ERROR: $e',
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Something went wrong',
                                  ),
                                ),
                              );
                            }

                            // =========================
                            // Stop Loading
                            // =========================

                            finally {
                              if (mounted) {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          },

                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 25),

          

                const SizedBox(height: 20),

                // =========================
                // Already have account?
                // =========================

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    const Text(
                      'Already have an account? ',
                    ),

                    TextButton(
                      onPressed: () {
                        context.pop();
                      },

                      child: const Text(
                        'Login',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}