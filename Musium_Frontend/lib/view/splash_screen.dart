import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musium/data/SharedPreferences/json_token.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/utils/utils_string_images.dart';
import 'package:musium/view/get_started.dart';
import 'package:musium/view/mainscreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkToken();
  }

  final _tokenStorage = TokenStorage();
  Future<void> _checkToken() async {
    final token = await _tokenStorage.getToken();
    if (token != null) {
      // use the token to authenticate the user
      Timer(const Duration(seconds: 3), () {
        Get.off(() => const HomeScreen());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => const GetStarted());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilsColor.primaryBlackColor,
      body: Center(child: Image.asset(UtilsStringImage.appLogo)),
    );
  }
}
