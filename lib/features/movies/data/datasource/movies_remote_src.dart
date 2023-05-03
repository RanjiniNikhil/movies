import 'package:movie_poster/features/movies/data/model/movies_item_model.dart';

abstract class MoviesRemoteSrc {
  Stream<MoviesItemModel> getMoviesInfo();
}
