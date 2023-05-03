import 'package:movie_poster/features/movies/data/model/movies_item_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://www.episodate.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/api/most-popular?page=1')
  Future<MoviesItemModel> getMoviesInfo();
}
