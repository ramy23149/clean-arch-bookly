import 'package:bookly/Features/home/data/data_sorsues/home_remote_dataSuerse.dart';
import 'package:bookly/Features/home/domain/entities/home_entity.dart';

import 'package:bookly/core/errors/failer.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repos/home_repo.dart';
import '../data_sorsues/home_local_dataSource.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSuerse homeRemoteDataSuers;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSuers, required this.homeLocalDataSource});

  @override
  Future<Either<Failer, List<BookEntitie>>> fetchFeaturedBooks({int pageNumber =0}) async {
    try {
      List<BookEntitie> books;
      books = homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSuers.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(message: e.toString()));
      
    }
  }

  @override
  Future<Either<Failer, List<BookEntitie>>> fetchNewestBooks({int pageNumber =0}) async {
    try {
      List<BookEntitie> books;
      books = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSuers.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    }  catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(message: e.toString()));
      
    }
  }
}
