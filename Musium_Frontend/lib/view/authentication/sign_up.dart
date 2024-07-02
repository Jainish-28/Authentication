import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musium/utils/components/custom_snackbar.dart';
import 'package:musium/utils/components/inputpassword_field.dart';
import 'package:musium/utils/components/submit_button.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/utils/utils_string_images.dart';
import 'package:musium/view/authentication/sign_in.dart';
import 'package:musium/viewmodel/authentication/signup_viewmodel.dart';
import '../../utils/components/inputtext_field.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final signUpVm= SignUpViewModel();
    final _formKey = GlobalKey<FormState>();
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
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 30,
                    color: UtilsColor.whiteColor,
                    fontWeight: FontWeight.normal,
                  ),
                )),
            Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
          child: TextFormField(
            controller: nameController,
            style: const TextStyle(color: UtilsColor.textPrimary),
            decoration:InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Enter Your Name',
                labelStyle: const TextStyle(color: UtilsColor.textSecondary),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: UtilsColor.secondaryBlackColor,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: UtilsColor.secondaryColor)
                )
            ),
                validator: (value) {
                    if (value!.isEmpty) {
                          return 'Please enter a name';
                    }
            }
          ),
        ),
            CustomInputTextField(controller: emailController),
            CustomPasswordField(controller: passwordController),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: SubmitButton(
                  title: "SignUp",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      var data = {
                        'name': nameController.value.text,
                        'email': emailController.value.text,
                        'password': passwordController.value.text
                      };
                      signUpVm.signupApi(data);
                    } else {
                      CustomSnackBar.showSnackBar("Please Enter valid Details","Hello dear");
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
              child: Row(
                children: [
                  const Text("Already have an account ?",style: TextStyle(color: UtilsColor.whiteColor,fontSize: 18),),
                  TextButton(onPressed: (){ Get.to(()=>const SignIn()); }, child: const Text("SignIn",style: TextStyle(color: UtilsColor.primaryColor,fontSize: 21,fontWeight: FontWeight.bold),))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
