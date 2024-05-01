import 'package:hive/hive.dart';

part 'home_entity.g.dart';
@HiveType(typeId: 0)

class BookEntitie {
@HiveField(0)
  final String bookId;
@HiveField(1)
  final String? image;
@HiveField(2)
  final String title;
@HiveField(3)
  final String? outher;
@HiveField(4)
  final num price;
  @HiveField(5)
  final num ratting;

  BookEntitie(
      {this.image,
      required this.title,
      this.outher,
      required this.price,
      required this.ratting,required this.bookId});
}
