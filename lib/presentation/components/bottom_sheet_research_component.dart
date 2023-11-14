// import 'package:flutter/material.dart';
// import 'package:superapp_mobile/auth/welcome.dart';
// import 'package:superapp_mobile/constant.dart';

// class BottomSheetFormResearchComponent extends StatelessWidget {
//   final VoidCallback studentButtonPressed;
//   final VoidCallback lecturerButtonPressed;

//   BottomSheetFormResearchComponent({
//     required this.studentButtonPressed,
//     required this.lecturerButtonPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(16.0),
//         topRight: Radius.circular(16.0),
//       ),
//       child: Container(
//         constraints: BoxConstraints(
//           maxHeight: MediaQuery.of(context).size.height * 0.8,
//         ),
//         padding: EdgeInsets.only(top: 50, bottom: 50),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               'Choose your role:',
//               style: TextStyle(
//                 fontFamily: 'Plus Jakarta Sans',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//               ),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: studentButtonPressed,
//               child: Text(
//                 'Student',
//                 style: TextStyle(
//                   fontFamily: 'Plus Jakarta Sans',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: primary,
//                 elevation: 0,
//                 shape: buttonShape,
//                 textStyle: buttonTextStyle,
//                 padding:
//                     EdgeInsets.only(top: 15, bottom: 15, right: 40, left: 40),
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: lecturerButtonPressed,
//               child: Text(
//                 'Lecturer',
//                 style: TextStyle(
//                   fontFamily: 'Plus Jakarta Sans',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: primary,
//                 elevation: 0,
//                 shape: buttonShape,
//                 textStyle: buttonTextStyle,
//                 padding:
//                     EdgeInsets.only(top: 15, bottom: 15, right: 40, left: 40),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
