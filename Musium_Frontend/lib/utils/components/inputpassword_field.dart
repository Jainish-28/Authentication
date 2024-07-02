import 'package:flutter/material.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/viewmodel/authentication/signup_viewmodel.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordField({super.key,required this.controller});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final signUpVM = SignUpViewModel();
  late  bool _obscureText=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(color: UtilsColor.textPrimary),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          labelText: 'Password',
          labelStyle: const TextStyle(color: UtilsColor.textSecondary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: UtilsColor.secondaryBlackColor,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: UtilsColor.secondaryColor)
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a password';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }
}
