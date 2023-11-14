// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:logger/logger.dart';
// import 'package:superapp_mobile/common/baseUrl.dart';
// import 'package:superapp_mobile/common/failure.dart';
// import 'package:superapp_mobile/common/globals.dart';
// import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
// import 'package:http/http.dart' as http;

// Future<Either<Failure, ResearchList>> getResearchs() async {
//   var uri = Uri.parse('$urlAPI/researchs');

//   Map<String, String> headers = {
//     'Authorization': 'Bearer $authToken',
//     'Content-Type': 'application/json', // Add other headers if needed
//   };

//   var response = await http.get(uri, headers: headers);
//   Logger().i("getResearchs : ${response.statusCode}");
//   Logger().i("data : ${response.body}");
//   if (response.statusCode == 200) {
//     String jsonDataString = response.body.toString();
//     var jsonData = jsonDecode(jsonDataString);
//     return Right(ResearchList.fromJson(jsonData));
//   } else {
//     return Left(ServerFailure(''));
//   }
// }
