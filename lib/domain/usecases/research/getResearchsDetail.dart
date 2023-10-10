import 'package:dartz/dartz.dart';
import 'package:superapp_mobile/common/failure.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchDetail.dart';
import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';
import 'package:superapp_mobile/domain/repositories/researchRepository.dart';

class GetResearchsDetail {
  final ResearchRepository repository;

  GetResearchsDetail(this.repository);

  Future<Either<Failure, ResearchDetail>> execute(String id) {
    return repository.getResearchDetail(id);
  }
}
