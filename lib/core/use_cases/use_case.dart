import 'package:bookly/core/errors/failer.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type, Pram> {
  Future<Either<Failer, Type>> call([Pram pageNumber]);
}
