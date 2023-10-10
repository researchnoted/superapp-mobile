import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/auth/login.dart';
import 'package:superapp_mobile/common/baseUrl.dart';
import 'package:superapp_mobile/common/globals.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/password_input.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // text input controller variables
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // logger variable
  var logger = Logger();

  bool isLoading = false;

  void _showCupertinoAlert(
      BuildContext context, String title, String message, String buttonText) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title,
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 20,
                  color: kblack,
                  fontWeight: FontWeight.bold)),
          content: Text(message,
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 13,
                  color: kblack,
                  fontWeight: FontWeight.w400)),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(buttonText,
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 13,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400)),
              onPressed: () {
                title == 'Error'
                    ? Navigator.of(context).pop()
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                ; // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // signup method
  Future<void> signupUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await http.post(
        Uri.parse('$urlAPI/register'),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'identity_number': identityNumberController.text,
          'password': passwordController.text,
          'role': regisRole,
          'phone_number': phoneNumberController.text
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        logger.i('Response Data: $responseData');
        _showCupertinoAlert(context, 'Success',
            'Registration is success as $regisRole, please login!', 'OK');
      } else {
        logger.e(response);

        _showCupertinoAlert(
            context, 'Error', 'Some fields are wrong!', 'Try again');

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      logger.e(e);
      _showCupertinoAlert(
          context, 'Oops...', 'Internal server error', 'Try again later');

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight + 300,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Create an account now with RAN",
                              style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 15,
                                  color: Colors.grey[700]),
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1, // Adjust as needed
                      ),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.2,
                              makeInput(
                                  label: "Name", controller: nameController)),
                          FadeAnimation(
                              1.2,
                              makeInput(
                                  label: "Email", controller: emailController)),
                          FadeAnimation(
                              1.2,
                              makeInput(
                                  label: regisRole == 'Student' ? 'NIM' : 'NIP',
                                  controller: identityNumberController)),
                          FadeAnimation(
                              1.2,
                              makeInput(
                                  label: "Phone Number",
                                  controller: phoneNumberController)),
                          FadeAnimation(
                              1.3,
                              PasswordInput(
                                label: "Password",
                                controller: passwordController,
                              )),
                        ],
                      ),
                    ),
                    FadeAnimation(
                        1.6,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1, // Adjust as needed
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: isLoading
                                ? null
                                : signupUser, // Disable button when isLoading is true
                            color: primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: isLoading
                                ? CircularProgressIndicator(
                                    // Set the valueColor to your desired color
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF029456)),
                                  ) // Show loader when isLoading is true
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: kwhite,
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                          ),
                        )),
                    FadeAnimation(
                        1.5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Already have an account?",
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                )),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: kblack,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              FadeAnimation(
                  1.2,
                  Container(
                    height: screenHeight * 0.25, // Adjust as needed
                    width: screenWidth * 0.7, // Adjust as needed
                    decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage('assets/images/login.png'),
                        //     fit: BoxFit.cover)
                        ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    Colors.black, // Color of the bottom border when not focused
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                    0xFF029456), // Color of the bottom border when focused
              ),
            ),
            // Other InputDecoration properties...
          ),
          controller: controller,
          obscureText: obscureText,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
