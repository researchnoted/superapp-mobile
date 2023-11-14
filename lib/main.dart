import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/data/source/api.dart';
import 'package:superapp_mobile/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:superapp_mobile/presentation/pages/auth/register/register_page.dart';
import 'package:superapp_mobile/presentation/pages/onboarding/onboarding.dart';

int? isViewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(ApiDataSource()),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        scaffoldBackgroundColor: kwhite,
        primarySwatch: Colors.blue,
        fontFamily: 'Plus Jakarta Sans',
      ),
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: widget!,
          );
        },
        home: isViewed != 0 ? const RegisterPage() : Onboarding(),
      ),
    );
  }
}
