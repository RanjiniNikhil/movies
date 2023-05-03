import 'package:dartz/dartz.dart';
import 'package:movie_poster/core/failure/failures.dart';
import 'package:movie_poster/features/movies/data/datasource/movies_remote_src.dart';
import 'package:movie_poster/features/movies/domain/entities/movies_response_item.dart';
import 'package:movie_poster/features/movies/domain/repository/movies_repository.dart';
import 'package:movie_poster/stringConstant.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRemoteSrc moviesRemoteSrc;

  MoviesRepositoryImpl(this.moviesRemoteSrc);

  @override
  Stream<Either<Failure, Movies>> getMoviesInfo() async* {
    try {
      var result = await moviesRemoteSrc.getMoviesInfo().single;
      yield Right(result);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      print("Final error is ${e.toString()} ${s.toString()}");
      yield Left(error);
    }
  }

  Future<Failure> checkErrorState(e, StackTrace s) async {
    print(e);
    return FailureMessage(StringConstant.kSomethingWentWrong);
  }
}
