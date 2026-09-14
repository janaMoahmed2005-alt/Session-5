import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:go_router/go_router.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),

      body: Column(
        children: [
      Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
             
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'New user?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        context.goNamed(Routes.homeScreen);
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              

              TextFormField(
                controller: emailController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 0,0,0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

              Align(alignment: Alignment.centerRight,
              child: SizedBox(
                width: 200,
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 88, 204),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Continue action
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        backgroundColor: Colors.black,
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

              //facebook sign in button
              SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        backgroundColor: Colors.black,
                      ),

                      onPressed: () {
                        // Handle event button press
                      },

              child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://img.magnific.com/premium-vector/social-media-icon-illustration-facebook-facebook-icon-vector-illustration_561158-2134.jpg?semt=ais_hybrid&w=740&q=80",
                            width: 24,
                            height: 24,
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            'Sign in with FaceBook',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ], 
              ),
                    ),
              ),


              //Apple sign in button
              SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        backgroundColor: Colors.black,
                      ),

                      onPressed: () {
                        // Handle event button press
                      },

              child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://www.clipartmax.com/png/middle/63-633340_apple-logo-apple-logo-png.png",
                            width: 24,
                            height: 24,
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            'Sign in with Apple',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ], 
              ),
                    ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.squarespace-cdn.com/content/v1/64961943d515bc438d50134d/1690572059449-69Z4WVD6DBUWECK4NF46/Pavlov_LegalShield_Thumbnail.png",
              fit: BoxFit.cover,
            ),
          ),
        ], 
      ),
    );
  }
}