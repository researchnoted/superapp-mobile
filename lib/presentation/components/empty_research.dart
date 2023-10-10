import 'package:flutter/material.dart';
import 'package:superapp_mobile/app_styles.dart';
import 'package:superapp_mobile/size_config.dart';

class EmptyResearch extends StatelessWidget {
  const EmptyResearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0), // Adjust the space as needed.
            child: Image.asset(
              'assets/empty-state.png', // Replace with the path to your image asset.
              width: 150, // Adjust the image width as needed.
              height: 150, // Adjust the image height as needed.
              // You can also set other properties for the image, such as fit, alignment, etc.
            ),
          ),
          Text(
            'Empty Research',
            style: kPoppinsBold.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
            ), // Customize the text style as needed.
          ),
          const SizedBox(height: 4.0),
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.5, // Set width to half of the screen width
                child: Text(
                  'Go click the + button to add and find your research',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: kPoppinsRegular.copyWith(
                    color: const Color(0xFF8B8B8B),
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ), // Customize the text style as needed.
                )),
          ),
        ],
      ),
    );
  }
}
