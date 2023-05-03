import 'package:get_it/get_it.dart';
import 'package:movie_poster/features/movies/data/datasource/movies_remote_src.dart';
import 'package:movie_poster/features/movies/data/datasource/movies_remote_src_impl.dart';
import 'package:movie_poster/features/movies/data/repository/movie_repository_impl.dart';
import 'package:movie_poster/features/movies/domain/repository/movies_repository.dart';
import 'package:movie_poster/features/movies/domain/usecase/movie_details_item.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => MoviesBloc(sl()));

  //usecases
  sl.registerLazySingleton(() => MoviesItem(sl()));

  //repository
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));

  //datasource
  sl.registerLazySingleton<MoviesRemoteSrc>(() => MoviesRemoteSrcImpl());
}
