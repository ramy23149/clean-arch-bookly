import 'package:hive/hive.dart';

import '../../../../constants.dart';
import '../../domain/entities/home_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntitie> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntitie> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntitie> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntitie>(kFeaturedBooks);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntitie> fetchNewestBooks({int pageNumber=0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntitie>(kNewestBooks);
    int length = box.values.length;
    if(startIndex >=length || endIndex>length){
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
