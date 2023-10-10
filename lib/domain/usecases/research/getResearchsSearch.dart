import 'package:dartz/dartz.dart';
import 'package:superapp_mobile/common/failure.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/domain/repositories/researchRepository.dart';

class GetResearchsSearch {
  final ResearchRepository repository;

  GetResearchsSearch(this.repository);

  Future<Either<Failure, ResearchList>> execute(String keyword) {
    return repository.getResearchSearch(keyword);
  }
}
