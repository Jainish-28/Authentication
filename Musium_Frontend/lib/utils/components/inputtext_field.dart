import 'package:flutter/material.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/viewmodel/authentication/signup_viewmodel.dart';

class CustomInputTextField extends StatelessWidget {
  final TextEditingController controller;
  CustomInputTextField({super.key,required this.controller});

  final signUpVm=SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: UtilsColor.textPrimary),
        decoration:InputDecoration(
            prefixIcon: const Icon(Icons.email_outlined),
            labelText: 'Enter E-Mail Id',
            labelStyle: const TextStyle(color: UtilsColor.textSecondary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: UtilsColor.secondaryBlackColor,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: UtilsColor.secondaryColor)
            )
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter an email';
          }
          if (!value.contains('@gmail.com')) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }
}
