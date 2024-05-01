import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.bookEntitie})
      : super(key: key);
  final List<BookEntitie> bookEntitie;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;

  void _onScroll() {
    var maxScroll = scrollController.position.maxScrollExtent;
    var cruntScrollble = scrollController.position.pixels;
    var presnetage = (cruntScrollble / maxScroll) * 100;
    if (presnetage >= 70) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FeaturedBooksCubit>(context)
            .featchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.bookEntitie.length, //

          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child:
                  CustomBookImage(image: widget.bookEntitie[index].image ?? ''),
            );
          }),
    );
  }
}
