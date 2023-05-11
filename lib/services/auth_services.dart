import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

class AuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithFacebook() async {
    final facebookLoginResult = await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();

    final facebookAuthCredential =
        FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  signInWithMicrosoft() async {
    final microsoftProvider = MicrosoftAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(microsoftProvider);
  }
}

class StoreUserData {
  Future<void> postData() async {
    final url = Uri.parse('http://10.0.2.2:3000/data');
    final user = FirebaseAuth.instance.currentUser;

    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("Token ${fcmToken}");

    final data = {
      'username': user?.displayName,
      'email': user?.email,
      'uid': user?.uid,
      'fcmToken': fcmToken,
    };

    final jsonData = jsonEncode(data);

    final response = await http.post(url, body: jsonData, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      print('Post request successful');
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
