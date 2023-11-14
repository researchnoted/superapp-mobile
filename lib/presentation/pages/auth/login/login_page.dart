import 'package:flutter/material.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/button.dart';
import 'package:superapp_mobile/presentation/components/heading.dart';
import 'package:superapp_mobile/presentation/components/input.dart';
import 'package:superapp_mobile/presentation/pages/auth/register/register_page.dart';
import 'package:superapp_mobile/presentation/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? accessLoginController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    accessLoginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    accessLoginController!.dispose();
    passwordController!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: white,
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
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      heading("Log In", "Masuk untuk melakukan recording"),
                      const SizedBox(height: 50.0),
                      Input(type: TypeInput.text, label: 'Email/NIM/NIP', controller: accessLoginController!),
                      Input(type: TypeInput.password, label: 'Password', controller: passwordController!),
                      Button(label: 'Log In', onPressed: () => {
                        Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const HomePage()))
                      }),
                      // FadeAnimation(
                      //   1.5,
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       const Text("Don't have an account?",
                      //           style: TextStyle(
                      //             fontFamily: 'Plus Jakarta Sans',
                      //           )),
                      //       TextButton(
                      //         onPressed: () {
                      //           Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => const RegisterPage()));
                      //         },
                      //         child: Text(
                      //           "Register",
                      //           style: TextStyle(
                      //             color: kblack,
                      //             fontFamily: 'Plus Jakarta Sans',
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ))
                    ],
                  )
                )
              ],
            )
          ),
        )
      );
  }
}