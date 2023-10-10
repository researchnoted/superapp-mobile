import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/app_styles.dart';
import 'package:superapp_mobile/auth/fetchs.dart';
import 'package:superapp_mobile/common/globals.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/home.dart';
import 'package:superapp_mobile/news_detail_screen.dart';
import 'package:superapp_mobile/presentation/components/empty_research.dart';
import 'package:superapp_mobile/size_config.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class NotificationResearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationResearchPageState();
}

class _NotificationResearchPageState extends State<NotificationResearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> researchData = [];
  String? errorMessage;
  late Future<void> fetchDataFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align items to the start (left)
            crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
            children: <Widget>[
              SizedBox(height: 40),
              Expanded(
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: researchData.isEmpty
                ? MediaQuery.of(context).size.height / 6
                : 15,
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 19),
        ],
      ),
    );
  }
}
