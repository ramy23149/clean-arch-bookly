import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/functions/sava_data.dart';
import 'package:bookly/core/utils/api_serviece.dart';

import '../../../../constants.dart';
import '../../domain/entities/home_entity.dart';

abstract class HomeRemoteDataSuerse {
  Future<List<BookEntitie>> fetchFeaturedBooks({int pageNumber=0});
  Future<List<BookEntitie>> fetchNewestBooks({int pageNumber=0});
}

class HomeRemoteDataSuersImpl extends HomeRemoteDataSuerse {
  final ApiService apiService;

  HomeRemoteDataSuersImpl(this.apiService);
  @override
  Future<List<BookEntitie>> fetchFeaturedBooks({int pageNumber=0}) async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber*10}');

    List<BookEntitie> booksList = getList(data);
    saveBooksData(booksList, kFeaturedBooks);
    return booksList;
  }

  @override
  Future<List<BookEntitie>> fetchNewestBooks({int pageNumber=0}) async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=general&startIndex=${pageNumber*10}');

    List<BookEntitie> booksList = getList(data);

    saveBooksData(booksList, kNewestBooks);

    return booksList;
  }

  List<BookEntitie> getList(Map<String, dynamic> data) {
    List<BookEntitie> booksList = [];

    for (var book in data['items']) {
      booksList.add(BookModel.fromJson(book));
    }
    return booksList;
  }
}
