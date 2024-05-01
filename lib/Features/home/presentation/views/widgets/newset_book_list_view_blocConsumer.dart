import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/snack_bar.dart';
import 'best_seller_list_view.dart';
import 'featured_book_listView_loadingIndecator.dart';

class NewestBookListviewBlocConsumer extends StatefulWidget {
  const NewestBookListviewBlocConsumer({super.key});

  @override
  State<NewestBookListviewBlocConsumer> createState() =>
      _NewestBookListviewBlocConsumerState();
}

class _NewestBookListviewBlocConsumerState
    extends State<NewestBookListviewBlocConsumer> {
  List<BookEntitie> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksCubitState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        } else if (state is NewestBooksPagenationFailuer) {
          showSnakBar(context, state.errMassege);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPagenationLoading) {
          return BestSellerListView(
            bookEntitie: books,
          );
        } else if (state is NewestBooksFailuer) {
          return Center(child: Text(state.errMassege));
        } else {
          return const BookListViewLoadingIndecator(
            scrollDirection: Axis.vertical,
          );
        }
      },
    );
  }
}
