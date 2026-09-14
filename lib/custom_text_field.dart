
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, 
  required this.controller,
  this.validator});

  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const SizedBox(height: 8),
      TextFormField(
                validator: widget.validator,
                controller: widget.controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:Theme.of(context).colorScheme.tertiary,
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),

                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),

                
     
              ),
    ],
    );

  }
}