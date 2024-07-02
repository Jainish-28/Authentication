import 'package:flutter/material.dart';
import 'package:musium/data/SharedPreferences/json_token.dart';
import 'package:musium/utils/components/submit_button.dart';
import 'package:musium/viewmodel/authentication/google_authentication.dart';


class HomeScreen extends StatefulWidget {
  // final String? name;
  // final String? img;
  // final String? email;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool imgLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SubmitButton(
                title: "Logout",
                onPress: () {
                  TokenStorage().logout();
                  SignInGoogle().logOut();
                })
          ],
        ),
      ),
    );
  }
}
