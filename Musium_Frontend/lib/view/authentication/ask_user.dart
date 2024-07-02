import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musium/utils/components/sign_in_buttons.dart';
import 'package:musium/utils/components/submit_button.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/utils/utils_string_images.dart';
import 'package:musium/view/authentication/sign_up.dart';
import 'package:musium/viewmodel/authentication/facebook_signin.dart';
import 'package:musium/viewmodel/authentication/google_authentication.dart';

class AskUser extends StatefulWidget {
  const AskUser({super.key});

  @override
  State<AskUser> createState() => _AskUserState();
}

class _AskUserState extends State<AskUser> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: UtilsColor.secondaryBlackColor.withOpacity(0.3),
      body: ListView(
        children: [
          Image.asset(UtilsStringImage.appLogo, height: height * 0.3),
          SizedBox(
            height: height * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Center(
                child: Text(
              "Let's get you in",
              style: TextStyle(fontSize: 40, color: UtilsColor.whiteColor),
            )),
          ),
          SIgnInButton(
              title: "Continue With Google",
              onPress: () {
                SignInGoogle().logIn();
              },
              img: UtilsStringImage.google),
          SIgnInButton(
              title: "Continue With apple",
              onPress: () {},
              img: UtilsStringImage.apple),
          SIgnInButton(
              title: "Continue With facebook",
              onPress: () {
                FacebookLogin().facebookLogin();
              },
              img: UtilsStringImage.facebook),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
            child: Row(children: <Widget>[
              Expanded(child: Divider()),
              Text(" or ",
                  style: TextStyle(fontSize: 16, color: UtilsColor.whiteColor)),
              Expanded(child: Divider()),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
            child:
                SubmitButton(title: "Log-in with a password", onPress: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
            child: Row(
              children: [
                const Text("Don't have an account ?",style: TextStyle(color: UtilsColor.whiteColor,fontSize: 20),),
                TextButton(onPressed: (){ Get.to(()=>const  SignUp());}, child: const Text("Sign-Up",style: TextStyle(color: UtilsColor.primaryColor,fontSize: 21,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
