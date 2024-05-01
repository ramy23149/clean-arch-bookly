import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/snack_bar.dart';
import '../../../domain/entities/home_entity.dart';
import 'featured_book_listView_loadingIndecator.dart';
import 'featured_list_view.dart';

class FeaturedBooksBuilder extends StatefulWidget {
  const FeaturedBooksBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksBuilder> createState() => _FeaturedBooksBuilderState();
}

class _FeaturedBooksBuilderState extends State<FeaturedBooksBuilder> {
  List<BookEntitie> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        } else if (state is FeaturedPaginationFailuer) {
          showSnakBar(context, state.errMassege);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedPaginationLoading) {
          return FeaturedBooksListView(
            bookEntitie: books,
          );
        } else if (state is FeaturedBooksFailuer) {
          return Center(child: Text(state.errMassege));
        }
        return const BookListViewLoadingIndecator(
          scrollDirection: Axis.horizontal,
        );
      },
    );
  }
}
