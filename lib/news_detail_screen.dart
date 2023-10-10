import 'package:flutter/material.dart';
import 'package:superapp_mobile/app_styles.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/size_config.dart';
import 'package:superapp_mobile/presentation/pages/home/research/createResearchPage.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLighterWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  // Research Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 20.0), // Add your desired padding here
                    child: Container(
                      margin: EdgeInsets.only(top: 50.0),
                      width: 300, // Set the desired width
                      child: Text(
                        'Potensi Tumbuh Kembang Sapi Ternak',
                        style: kPoppinsBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 7,
                        ),
                      ),
                    ),
                  ),

                  // Scrollview Research Detail
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Color(0xffececec),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/research-image.jpg",
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: -10,
                              right: 0,
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              25.0), // Adjust the value as needed
                                          color: Colors
                                              .white, // You can set the background color here
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  25.0), // Same value as above
                                              child: Image.asset(
                                                "assets/Image icon.png",
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              25.0), // Adjust the value as needed
                                          color: Colors
                                              .white, // You can set the background color here
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  25.0), // Same value as above
                                              child: Image.asset(
                                                "assets/Image icon.png",
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              25.0), // Adjust the value as needed
                                          color: Colors
                                              .white, // You can set the background color here
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  25.0), // Same value as above
                                              child: Image.asset(
                                                "assets/Image icon.png",
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              25.0), // Adjust the value as needed
                                          color: Colors
                                              .white, // You can set the background color here
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  25.0), // Same value as above
                                              child: Image.asset(
                                                "assets/Image icon.png",
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Invitro",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: const JoinResearchButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class JoinResearchButton extends StatelessWidget {
  const JoinResearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: SizedBox(
        width: 570.0,
        height: 70.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateResearchPage()),
            );
          },
          backgroundColor: const Color(0xFF029456),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Text(
            "Join Research",
            style: TextStyle(
              color: kwhite,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 17,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}
