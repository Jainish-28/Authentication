import 'package:musium/data/network/network_api_services.dart';
import 'package:musium/res/app_url/app_url.dart';

class AppRepository{
  
  final _apiService = NetworkApiServices();
  
  Future<dynamic> signUpApi(var data) async{
    
    dynamic response= _apiService.postUserData(AppUrl.registerApi,data);
    return response;
  }

  Future<dynamic> signInApi(var data) async{

    dynamic response= _apiService.userSignIn(AppUrl.loginApi,data);
    return response;
  }

  Future<dynamic> getApiData() async{

    dynamic response= _apiService.getUserData(AppUrl.registerApi);
    return response;
  }

  // Future<dynamic> googleUserSignInApi(var googleData) async{
  //
  //   dynamic response= _apiService.googleUserSignIn(AppUrl.googleUserApi, googleData);
  //   return response;
  // }
}