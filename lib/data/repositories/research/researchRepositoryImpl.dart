import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:superapp_mobile/common/baseUrl.dart';
import 'package:superapp_mobile/common/failure.dart';
import 'package:superapp_mobile/common/globals.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchDetail.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/domain/repositories/researchRepository.dart';

class ResearchRepositoryImpl implements ResearchRepository {
  final http.Client client;

  ResearchRepositoryImpl({required this.client});

  Map<String, String> headers = {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json', // Add other headers if needed
  };

  @override
  Future<Either<Failure, ResearchList>> getResearchs() async {
    var uri = Uri.parse('$urlAPI/researchs');

    var response = await client.get(uri, headers: headers);
    Logger().i("getResearchs : ${response.statusCode}");
    Logger().i("data : ${response.body}");
    if (response.statusCode == 200) {
      String jsonDataString = response.body.toString();
      var jsonData = jsonDecode(jsonDataString);
      return Right(ResearchList.fromJson(jsonData));
    } else {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, ResearchDetail>> getResearchDetail(String id) async {
    var uri = Uri.parse('$urlAPI/researhcs/$id');

    var response = await client.get(uri, headers: headers);
    Logger().i("getResearchsDetail : ${response.statusCode}");
    Logger().i("data : ${response.body}");

    if (response.statusCode == 200) {
      String jsonDataString = response.body.toString();
      var jsonData = jsonDecode(jsonDataString);
      return Right(ResearchDetail.fromJson(jsonData));
    } else {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, ResearchList>> getResearchSearch(
      String keyword) async {
    var uri = Uri.parse('$urlAPI/resarchs?keyword=$keyword');

    var response = await client.get(uri, headers: headers);
    Logger().i("getResearchsSearch : ${response.statusCode}");
    Logger().i("data : ${response.body}");

    if (response.statusCode == 200) {
      String jsonDataString = response.body.toString();
      var jsonData = jsonDecode(jsonDataString);
      return Right(ResearchList.fromJson(jsonData));
    } else {
      return Left(ServerFailure(''));
    }
  }
}
