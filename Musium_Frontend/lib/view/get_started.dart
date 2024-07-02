import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musium/utils/components/submit_button.dart';
import 'package:musium/utils/utils_color.dart';
import 'package:musium/view/authentication/ask_user.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height*1;
    final width=MediaQuery.sizeOf(context).width*1;
    return Scaffold(
      backgroundColor: UtilsColor.primaryColor,
      body : Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Image.asset("assets/musiumImage/onboard_girl.png",height: height*0.45,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 420),
            child: Container(
              height: height*0.55,
              width: width*1,
              decoration: const BoxDecoration(
                color: UtilsColor.primaryBlackColor,
                borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30)
                )
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50,left: 30,right: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "From the  ",
                            style: TextStyle(color: UtilsColor.whiteColor,fontSize: 26,fontWeight: FontWeight.bold,),
                          ),
                          TextSpan(
                            text: "latest ",
                            style: TextStyle(color: UtilsColor.primaryColor,fontSize: 26,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " to the ",
                            style: TextStyle(color: UtilsColor.whiteColor,fontSize: 26,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "greatest  ",
                            style: TextStyle(color: UtilsColor.secondaryColor,fontSize: 26,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "hits, play your favorite tracks on  ",
                            style: TextStyle(color: UtilsColor.whiteColor,fontSize: 26,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "musium  ",
                            style: TextStyle(color: UtilsColor.glowPrimaryColor,fontSize: 26,fontWeight: FontWeight.bold,shadows: <Shadow>[
                              Shadow(
                                  blurRadius: 10.0,
                                  color: UtilsColor.glowPrimaryColor
                              )]),
                          ),
                          TextSpan(
                            text: " now!",
                            style: TextStyle(color: UtilsColor.whiteColor,fontSize: 26,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:150,bottom: 20,left: 30,right: 30),
                    child: SubmitButton(
                        title: "Get Started",
                        onPress: (){
                          Get.to(()=>const AskUser());
                    }))
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
