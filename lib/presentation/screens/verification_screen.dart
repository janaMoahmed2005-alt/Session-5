import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/data/data_source/Auth/auth_remote_data_source.dart';
//import 'package:flutter_application_1/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;

  Future<void> verifyEmail() async {
    // Check OTP length
    if (otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the 6-digit code'),
        ),
      );
      return;
    }

    // Start loading
    setState(() {
      isLoading = true;
    });

    try {
      // Call backend
      final success = await authService.verifyEmail(
        email: widget.email,
        otp: otpController.text.trim(),
      );

      if (!mounted) return;

      if (success) {
        // Verification successful
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email verified successfully'),
          ),
        );

        // Go to Product Screen
        context.pushNamed(
          Routes.productScreen,
          queryParameters: {
            'title': 'Product Screen',
          },
        );
      } else {
        // Verification failed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification failed. Please check the code.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 50),

            // Title
            Text(
              'Verify your email',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Description
            Text(
              'Enter the code sent to:',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 5),

            // User email
            Text(
              widget.email,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 40),

            // OTP input
            Pinput(
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 40),

            // Verify button
            SizedBox(
              width: double.infinity,
              height: 54,

              child: FilledButton(
                onPressed: isLoading ? null : verifyEmail,

                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Verify Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}