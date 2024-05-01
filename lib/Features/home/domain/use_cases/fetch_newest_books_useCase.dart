import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failer.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/home_entity.dart';

class FetchNewestBooksUseCase extends UserCase<List<BookEntitie>, int> {//lma ykon el pram m4 required bt7ot void wa kan momkan t3ml class asmo NoPram t7oto hna
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failer, List<BookEntitie>>> call([int pageNumber=0]) {

    //hna moken tkon m32da akter 
    return homeRepo.fetchNewestBooks(pageNumber: pageNumber);
  }
}
