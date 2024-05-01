import '../../../domain/entities/home_entity.dart';

abstract class NewestBooksCubitState {}

class NewestBooksCubitInitial extends NewestBooksCubitState {}

class NewestBooksLoading extends NewestBooksCubitState {}

class NewestBooksFailuer extends NewestBooksCubitState {
  final String errMassege;

  NewestBooksFailuer(this.errMassege);
}

class NewestBooksSuccess extends NewestBooksCubitState {
  final List<BookEntitie> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksPagenationLoading extends NewestBooksCubitState {}
class NewestBooksPagenationFailuer extends NewestBooksCubitState {
  final String errMassege;

  NewestBooksPagenationFailuer(this.errMassege);

}

