import 'package:superapp_mobile/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchDetail.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';

abstract class ResearchRepository {
  Future<Either<Failure, ResearchList>> getResearchs();
  Future<Either<Failure, ResearchDetail>> getResearchDetail(String id);
  Future<Either<Failure, ResearchList>> getResearchSearch(String keyword);
}
