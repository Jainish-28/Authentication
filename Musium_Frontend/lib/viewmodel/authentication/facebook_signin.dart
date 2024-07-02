import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:musium/utils/components/custom_snackbar.dart';
import 'package:musium/view/mainscreen/home_screen.dart';

class FacebookLogin {
  Future facebookLogin() async {
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);

      if (result.status == LoginStatus.success) {

        final userData= await FacebookAuth.i.getUserData();
      //   Get.to(()=>HomeScreen(name: userData['name'].toString(),img: userData['picture']['data']['url'].toString(),email: userData['email'].toString(),));
      //
        }
    } catch (error) {
      CustomSnackBar.showSnackBar(error.toString(),"Error is");
    }
  }
}
