import 'package:bookly/core/widgets/custom_fadding_widget.dart';
import 'package:flutter/material.dart';

import 'cutom_book_image_loading_indecator.dart';

class BookListViewLoadingIndecator extends StatelessWidget {
  const BookListViewLoadingIndecator({super.key, required this.scrollDirection});
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    return CustomFaddingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            scrollDirection:scrollDirection,
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CutomBookImageLoadignLoadingIndecator());
            }),
      ),
    );
  }
}
