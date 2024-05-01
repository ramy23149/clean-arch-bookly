import 'package:bookly/Features/home/domain/entities/home_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntitie> books;

  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailuer extends FeaturedBooksState {
  final String errMassege;

  FeaturedBooksFailuer(this.errMassege);
}

class FeaturedPaginationLoading extends FeaturedBooksState {}

class FeaturedPaginationFailuer extends FeaturedBooksState {
  final String errMassege;

  FeaturedPaginationFailuer(this.errMassege);
}
