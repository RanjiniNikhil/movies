class Movies {
  Movies({required this.tvShows});

  List<TvShow> tvShows;
}

class TvShow {
  TvShow({
    required this.id,
    required this.name,
    required this.imageThumbnailPath,
  });

  int id;
  String name;
  String imageThumbnailPath;
}
