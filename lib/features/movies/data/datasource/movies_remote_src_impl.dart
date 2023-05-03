import 'package:movie_poster/core/retrofit/rest_client.dart';
import 'package:movie_poster/core/retrofit/retro_base.dart';
import 'package:movie_poster/features/movies/data/datasource/movies_remote_src.dart';
import 'package:movie_poster/features/movies/data/model/movies_item_model.dart';

class MoviesRemoteSrcImpl implements MoviesRemoteSrc {
  @override
  Stream<MoviesItemModel> getMoviesInfo() {
    return Stream.fromFuture(
        RestClient(RetroBase().dioData()).getMoviesInfo().then((value) {
      return value;
    }));
  }
}
