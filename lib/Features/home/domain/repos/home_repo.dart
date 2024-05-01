import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failer.dart';

abstract class HomeRepo {
  Future<Either<Failer, List<BookEntitie>>> fetchFeaturedBooks({int pageNumber =0});
  Future<Either<Failer, List<BookEntitie>>> fetchNewestBooks({int pageNumber =0});
}
