import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:musium/data/SharedPreferences/json_token.dart';
import 'package:musium/data/app_exception.dart';
import 'package:musium/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:musium/res/app_url/app_url.dart';
import 'package:musium/utils/components/custom_snackbar.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getUserData(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      // responseJson=returnResponse(response);
    } on SocketException {
      throw InternetException();
    }

    return responseJson;
  }

  @override
  Future<dynamic> postUserData(
    String url,
    var data,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse(AppUrl.registerApi),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 201) {
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      } else if (response.statusCode == 400) {
        CustomSnackBar.showSnackBar(
            "Name,E-Mail,Password Required ${response.statusCode}",
            "Hello Dear");
      } else {
        CustomSnackBar.showSnackBar(
            "Server Error ${response.statusCode}", "Hello Dear");
      }
    } on SocketException {
      throw InternetException();
    } on RequestTimeOutException {
      throw RequestTimeOutException();
    } catch (e) {
      ServerException();
    }
  }

  @override
  Future<dynamic> userSignIn(
    String url,
    var data,
  ) async {
    try {
      final response = await http.post(Uri.parse(AppUrl.loginApi),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
      if (response.statusCode == 201) {
        dynamic responseJson = jsonDecode(response.body);
        final token= responseJson['token'].toString();
        if (kDebugMode) {
          print(token);
        }
        await TokenStorage().storeToken(token);
        return responseJson;
      } else if (response.statusCode == 404) {
        CustomSnackBar.showSnackBar("Enter Valid Password", "Hello Dear");
      } else {
        CustomSnackBar.showSnackBar("Check Email Id ", "Hello Dear");
      }
    } on SocketException {
      throw InternetException();
    } on RequestTimeOutException {
      throw RequestTimeOutException();
    } catch (e) {
      CustomSnackBar.showSnackBar(e.toString(), "Error is");
    }
  }

  // @override
  // Future<dynamic> googleUserSignIn(
  //     String url,
  //     var googleData)
  // async {
  //   try{
  //       final response= await http.post(Uri.parse(AppUrl.googleUserApi),
  //           headers: {
  //             'Content-Type': 'application/json',
  //           },
  //           body: jsonEncode(googleData));
  //       print("Google Data is${jsonEncode(googleData)}");
  //       print(response.statusCode);
  //       if(response.statusCode == 201){
  //         dynamic responseJson =jsonDecode(response.body);
  //         return responseJson;
  //       }
  //       else if(response.statusCode == 405){
  //         CustomSnackBar.showSnackBar("Name And Email Required", "Heyy");
  //       }
  //       else{
  //         CustomSnackBar.showSnackBar("Invalid Request", "Sorry");
  //       }
  //   }on SocketException{
  //     throw InternetException();
  //   }on RequestTimeOutException{
  //     throw RequestTimeOutException();
  //   }catch(error){
  //     CustomSnackBar.showSnackBar(error.toString(), "Sorry");
  //   }
  // }
}
