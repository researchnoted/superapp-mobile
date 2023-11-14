import 'package:flutter/material.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/presentation/components/bottom_sheet_role.dart';

import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile/presentation/pages/auth/login/login_page.dart';
import 'package:superapp_mobile/presentation/pages/auth/register/register_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

final buttonTextStyle = TextStyle(
  color: kwhite,
  fontFamily: 'Plus Jakarta Sans',
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

final buttonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),
);

class Welcome extends StatelessWidget {
  void _openBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Select a role",
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('roleSelectedForRegister', 'Student');
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                ); // Close the bottom sheet
              },
              child: const Text("Student",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('roleSelectedForRegister', 'Lecturer');

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                ); // Close the bottom sheet
              },
              child: const Text("Lecturer",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              // Handle cancel
              Navigator.of(context).pop(); // Close the bottom sheet
            },
            child: const Text("Cancel",
                style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Automatic identity verification which enables you to verify your identity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      )),
                ],
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/login.png'))),
                  )),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.6,
                      Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            _openBottomSheet(context);
                          },
                          color: primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Registrasi",
                            style: TextStyle(
                                color: kwhite,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
