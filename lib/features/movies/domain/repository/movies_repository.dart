import 'package:dartz/dartz.dart';
import 'package:movie_poster/core/failure/failures.dart';
import 'package:movie_poster/features/movies/domain/entities/movies_response_item.dart';

abstract class MoviesRepository {
  Stream<Either<Failure, Movies>> getMoviesInfo();
}
