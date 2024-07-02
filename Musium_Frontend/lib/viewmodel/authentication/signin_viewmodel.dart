import 'package:get/get.dart';
import 'package:musium/data/SharedPreferences/json_token.dart';
import 'package:musium/data/repository/app_repository.dart';
import 'package:musium/utils/components/custom_snackbar.dart';
import 'package:musium/view/mainscreen/home_screen.dart';

class SignInViewModel {

  final _api=AppRepository();
  final _tokenStorage = TokenStorage();

  void signinApi(var data){
    _api.signInApi(data).then((value)async{
      final token = await _tokenStorage.getToken();
      if (token!= null) {
        // use the token to authenticate the user
        Get.offAll(() => const HomeScreen());
      } else {
        CustomSnackBar.showSnackBar("Token not found", "Error is");
      }
    }).onError((error, stackTrace) { CustomSnackBar.showSnackBar(error.toString(),"Error is");});
  }
}