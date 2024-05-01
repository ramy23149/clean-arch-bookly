import 'package:bookly/Features/home/domain/use_cases/fetchFeaturedBooks_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FeatchFeaturedBooksUseCase featchFeaturedBooksUseCase;
  Future<void> featchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedPaginationLoading());
    }
    var result = await featchFeaturedBooksUseCase.call(pageNumber);
    result.fold((error) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailuer(error.message));
      } else {
        emit(FeaturedPaginationFailuer(error.message));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
