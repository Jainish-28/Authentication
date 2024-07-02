import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundSignIn extends StatelessWidget {
  const RoundSignIn({super.key,required this.img,required this.onTap});
  final String img;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
         height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover)
        ),
      ),
    );
  }
}

