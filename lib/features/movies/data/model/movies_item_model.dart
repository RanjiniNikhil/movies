import 'package:movie_poster/features/movies/domain/entities/movies_response_item.dart';

class MoviesItemModel extends Movies {
  MoviesItemModel({required List<TvShowItemModel> tvShows})
      : super(tvShows: tvShows);

  factory MoviesItemModel.fromJson(Map<String, dynamic> json) {
    MoviesItemModel moviesItemModel = MoviesItemModel(
      tvShows: List<TvShowItemModel>.from(
          json["tv_shows"].map((x) => TvShowItemModel.fromJson(x))),
    );
    return moviesItemModel;
  }
}

class TvShowItemModel extends TvShow {
  TvShowItemModel(
      {required int id,
      required String name,
      required String imageThumbnailPath})
      : super(id: id, name: name, imageThumbnailPath: imageThumbnailPath);

  factory TvShowItemModel.fromJson(Map<String, dynamic> json) {
    TvShowItemModel tvShowItemModel = TvShowItemModel(
      id: json["id"],
      name: json["name"],
      imageThumbnailPath: json["image_thumbnail_path"],
    );
    return tvShowItemModel;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_thumbnail_path": imageThumbnailPath,
      };
}
