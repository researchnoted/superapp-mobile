import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  // store the user's authentication token
  String? authToken;

  // setter method to update the token
  void setAuthToken(String token) {
    authToken = token;
    notifyListeners(); // notify listeners of the change
  }

  // getter method to get the token
  String? getAuthToken() {
    return authToken;
  }
}
