import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String description;
  final Color background;
  final Color button;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.description,
    required this.background,
    required this.button,
  });
}

List<OnboardingContents> onboarding_contents = [
  OnboardingContents(
      title: 'Recording And Storing Data Accurately',
      image: 'assets/images/img-1.png',
      description:
          'Recording can be done effectively without worrying about data loss and scattering, securely and accurately stored.',
      background: Colors.white,
      button: Color(0xFF4756DF)),
  OnboardingContents(
      title: 'The Speed Of Livestock Data Recording',
      image: 'assets/images/img-2.png',
      description:
          'Livestock data recording for research purposes can now be done quickly and on schedule in lab or field.',
      background: Colors.white,
      button: Color(0xFF4756DF)),
  OnboardingContents(
      title: 'Using NFC For Livestock Data Recording',
      image: 'assets/images/img-3.png',
      description:
          'NFC enhances data accuracy for research and assists instructors in monitoring students\' livestock research effectively.',
      background: Colors.white,
      button: Color(0xFF4756DF)),
];
