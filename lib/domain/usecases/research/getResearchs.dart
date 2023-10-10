import 'package:dartz/dartz.dart';
import 'package:superapp_mobile/common/failure.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/domain/repositories/researchRepository.dart';

class GetResearchs {
  final ResearchRepository repository;

  GetResearchs(this.repository);

  Future<Either<Failure, ResearchList>> execute() {
    return repository.getResearchs();
  }
}
