import 'package:hive/hive.dart';

import '../../Features/home/domain/entities/home_entity.dart';

void saveBooksData(List<BookEntitie> books,String box){
  var box1 = Hive.box<BookEntitie>(box);
  box1.addAll(books);
}