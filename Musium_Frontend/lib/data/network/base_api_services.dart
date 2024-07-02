abstract class BaseApiServices{

  Future<dynamic> getUserData(String url);
  Future<dynamic> postUserData(String url,var data,);
  Future<dynamic> userSignIn(String url,var data,);
//   Future<dynamic> googleUserSignIn(String url,var googleData,);
}