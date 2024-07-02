import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musium/data/SharedPreferences/json_token.dart';
import 'package:musium/data/repository/app_repository.dart';
import 'package:musium/utils/components/custom_snackbar.dart';
import 'package:musium/view/authentication/ask_user.dart';
import 'package:musium/view/mainscreen/home_screen.dart';

class SignInGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _tokenStorage = TokenStorage();
  Future logIn() async {
    try {
      final user = await _googleSignIn.signIn();

      if (user == null) {
        CustomSnackBar.showSnackBar("SignIn Failed", "");
      } else {
        final token=user.email.toString();
        await _tokenStorage.storeToken(token);
        Get.offAll(()=>HomeScreen());
      }
    } catch (error) {
      CustomSnackBar.showSnackBar(error.toString(), "Error is");
    }
  }

  Future logOut() async {
    await _googleSignIn.disconnect();
    CustomSnackBar.showSnackBar("Logout Successfully", "Hello dear");
    Get.to(() => const AskUser());
  }
}
