import 'package:flutter/material.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';

Column heading(String heading, String subheading) {
    return Column(
      children: [
        FadeAnimation(
          1.0,
          Text(
            heading,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 40,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FadeAnimation(
          1.2,
          Text(
            subheading,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 15,
              color: Colors.grey
            ),
          ),
        ),
      ],
    );
  }