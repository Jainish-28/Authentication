import 'package:get/get.dart';
import 'package:musium/data/repository/app_repository.dart';
import 'package:musium/utils/components/custom_snackbar.dart';
import 'package:musium/view/authentication/sign_in.dart';

class SignUpViewModel extends GetxController {

  bool signUp = false;

  final _api = AppRepository();

  void signupApi(var data) {
    signUp = true;
    _api.signUpApi(data).then((value) {
      signUp = false;
      Get.to(() => const SignIn());
    }).onError((error, stackTrace) {
      signUp = false;
      CustomSnackBar.showSnackBar(error.toString(),"Error is");
    });
  }
}
