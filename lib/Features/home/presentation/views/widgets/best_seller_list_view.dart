import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key, required this.bookEntitie});
  final List<BookEntitie> bookEntitie;

  // int pageNumber = 1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    //  controller: controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: bookEntitie.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookEntitie: bookEntitie[index],
          ),
        );
      },
    );
  }
}
