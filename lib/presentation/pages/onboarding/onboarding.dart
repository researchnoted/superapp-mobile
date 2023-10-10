import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superapp_mobile/auth/welcome.dart';
import 'package:superapp_mobile/presentation/pages/onboarding/component/onboarding_contents.dart';

import '../../../constant.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // active index that represents each onboard content
  // default set to 0
  int currentIndex = 0;

  // controller to manipulate screen or page
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardingInfo() async {
    // to count how many onboard is viewed by the user
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      appBar: AppBar(
        backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardingInfo();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Welcome()));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.normal,
                color: currentIndex % 2 == 0 ? kblack : kwhite,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PageView.builder(
            itemCount: onboarding_contents.length,
            controller: _pageController, // Allow swipe gestures
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Image.asset(
                    onboarding_contents[index].image,
                    height: screenHeight * 0.45,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < onboarding_contents.length; i++)
                        GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              i, // The index of the page to switch to
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            width: currentIndex == i
                                ? screenHeight * 0.03
                                : screenHeight * 0.012,
                            height: screenHeight * 0.012,
                            decoration: BoxDecoration(
                              color: currentIndex == i ? kbrown : kbrown300,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    onboarding_contents[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.032,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                      color: index % 2 == 0 ? textSecondary : kwhite,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.009),
                  Text(
                    onboarding_contents[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.0182,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.normal,
                      color: index % 2 == 0 ? kblack : kwhite,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  InkWell(
                    onTap: () async {
                      if (index == onboarding_contents.length - 1) {
                        await _storeOnboardingInfo();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Welcome()));
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? primary : kwhite,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              fontSize: screenHeight * 0.016,
                              color: index % 2 == 0 ? kwhite : kblue,
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.0025,
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: index % 2 == 0 ? kwhite : kblue,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
