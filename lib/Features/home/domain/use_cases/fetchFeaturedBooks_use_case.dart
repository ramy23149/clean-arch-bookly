import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failer.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';

class FeatchFeaturedBooksUseCase extends UserCase<List<BookEntitie>, int> {
  FeatchFeaturedBooksUseCase(this.homeRepo);

  final HomeRepo homeRepo;

  @override
  Future<Either<Failer, List<BookEntitie>>> call([int pageNumber=0]) {
    return homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
