import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/fetch_newest_books_useCase.dart';
import 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(NewestBooksCubitInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> featchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPagenationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((error) {
      if (pageNumber == 0) {
        emit(NewestBooksFailuer(error.message));
      }else{
        emit(NewestBooksPagenationFailuer(error.message));
      }
    }, (books) => emit(NewestBooksSuccess(books)));
  }
}
