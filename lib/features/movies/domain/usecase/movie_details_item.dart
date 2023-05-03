import 'package:dartz/dartz.dart';
import 'package:movie_poster/core/failure/failures.dart';
import 'package:movie_poster/core/usecase/usecases.dart';
import 'package:movie_poster/features/movies/domain/entities/movies_response_item.dart';
import 'package:movie_poster/features/movies/domain/repository/movies_repository.dart';

class MoviesItem extends UseCase<Movies, NoParams> {
  MoviesRepository moviesRepository;

  MoviesItem(this.moviesRepository);

  @override
  Stream<Either<Failure, Movies>> call(NoParams params) {
    return moviesRepository.getMoviesInfo();
  }
}
