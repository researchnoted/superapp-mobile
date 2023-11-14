import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/data/model/request/register_model.dart';
import 'package:superapp_mobile/presentation/components/button.dart';
import 'package:superapp_mobile/presentation/components/heading.dart';
import 'package:superapp_mobile/presentation/components/input.dart';
import 'package:superapp_mobile/presentation/pages/auth/login/login_page.dart';
import 'package:superapp_mobile/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? identityNumberController;
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    identityNumberController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    identityNumberController!.dispose();
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  void register(String role) {
    final requestModel = RegisterModel(role: role, identityNumber: identityNumberController!.text, name: nameController!.text, email: emailController!.text, password: passwordController!.text);

    context.read<RegisterBloc>().add(StoreRegisterEvent(request: requestModel));
    Logger().i("TEST");
  }

  Future<String> getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('roleSelectedForRegister') ?? '';
  }
  
  @override
  Widget build(BuildContext context) {
    Logger().i("ROLE PREFS ${getPrefs()}");
    
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
        body: FutureBuilder(
          future: getPrefs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Return a loading indicator while the future is being resolved
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Handle any errors that occurred during the Future computation
              return Text('Error: ${snapshot.error}');
            } else {
              // The Future is complete, display the data
              String rolePrefs = snapshot.data ?? ''; // Provide a default value if data is null

              Logger().i("ROLE PREFS $rolePrefs");

              return SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            heading("Registrasi", "Buat akunmu untuk melakukan recording"),
                            const SizedBox(height: 30.0),
                            Input(type: TypeInput.text, label: rolePrefs == 'Student' ? 'NIM' : 'NIP', controller: identityNumberController!),
                            Input(type: TypeInput.text, label: 'Nama Lengkap', controller: nameController!),
                            Input(type: TypeInput.text, label: 'Email', controller: emailController!),
                            Input(type: TypeInput.password, label: 'Password', controller: passwordController!),
                            Button(label: 'Registrasi', onPressed: () {
                              register(rolePrefs);
                            }),
                            // FadeAnimation(
                            //   1.5,
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: <Widget>[
                            //       const Text("Have an account?",
                            //           style: TextStyle(
                            //             fontFamily: 'Plus Jakarta Sans',
                            //           )),
                            //       TextButton(
                            //         onPressed: () {
                            //           Navigator.pushReplacement(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) => const LoginPage()));
                            //         },
                            //         child: Text(
                            //           "Log In",
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
              );
            }
          }
        )
      );
  }
}