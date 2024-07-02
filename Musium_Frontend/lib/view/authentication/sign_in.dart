import 'package:flutter/material.dart';
import 'package:musium/utils/components/custom_snackbar.dart';
import 'package:musium/utils/components/inputpassword_field.dart';
import 'package:musium/utils/components/inputtext_field.dart';
import 'package:musium/utils/components/round_signin_btn.dart';
import 'package:musium/utils/components/submit_button.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/utils/utils_string_images.dart';
import 'package:musium/viewmodel/authentication/google_authentication.dart';
import 'package:musium/viewmodel/authentication/signin_viewmodel.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final signInVM=SignInViewModel();
    return Scaffold(
      backgroundColor: UtilsColor.secondaryBlackColor.withOpacity(0.3),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
              child: Container(
                height: height * 0.3,
                width: width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.15),
                    image: const DecorationImage(
                        image: AssetImage(UtilsStringImage.appLogo),
                        fit: BoxFit.cover)),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
                child: Text(
                  "Login To Your Account",
                  style: TextStyle(
                    fontSize: 25,
                    color: UtilsColor.whiteColor,
                    fontWeight: FontWeight.normal,
                  ),
                )),
            CustomInputTextField(controller: emailController,),
            CustomPasswordField(controller: passwordController,),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
              child: SubmitButton(
                  title: "Sign-IN",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                       var data={
                        'email':emailController.value.text,
                        'password':passwordController.value.text
                      };
                      signInVM.signinApi(data);
                    } else {
                      CustomSnackBar.showSnackBar("Check Your Email-Id Or Password","Hello Dear");
                    }
                  }),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(" or continue with ",
                    style: TextStyle(fontSize: 16, color: UtilsColor.whiteColor)),
                Expanded(child: Divider()),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundSignIn(img: UtilsStringImage.google,onTap: (){SignInGoogle().logIn();},),
                RoundSignIn(img: UtilsStringImage.apple,onTap: (){}),
                RoundSignIn(img: UtilsStringImage.facebook,onTap: (){})
              ],
            )

          ],
        ),
      ),
    );
  }
}
