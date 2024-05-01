import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'custom_app_bar.dart';
import 'featured_book_blocConsumer.dart';
import 'newset_book_list_view_blocConsumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int pageNumber = 1;
  late ScrollController controller;
  bool isLoading = false;

  void onScroll() {
    var maxScroll = controller.position.maxScrollExtent;
    var cruntScrollble = controller.position.pixels;
    var presnetage = (cruntScrollble / maxScroll) * 100;
    if (presnetage >= 70) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<NewestBooksCubit>(context)
            .featchNewestBooks(pageNumber: pageNumber++);
      }
      isLoading = false;
    }
  }

  @override
  void initState() {
    controller = ScrollController();
    super.initState();

    controller.addListener(() {
      onScroll();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      controller: controller,
      slivers: const [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksBuilder(
                
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBookListviewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}


