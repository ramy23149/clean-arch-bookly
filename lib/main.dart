import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetchFeaturedBooks_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_useCase.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/bloc_observer.dart';
import 'package:bookly/core/functions/service_locator.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';

void main() async {
  serviceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitieAdapter());
  await Hive.openBox<BookEntitie>(kFeaturedBooks);
  await Hive.openBox<BookEntitie>(kNewestBooks);
  Bloc.observer = AppObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
              FeatchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()))
            ..featchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..featchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
