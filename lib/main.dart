import 'package:flutter/material.dart';
import 'package:movie_poster/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_event.dart';
import 'package:movie_poster/features/movies/presentation/pages/movie_detail.dart';
import 'package:movie_poster/features/movies/injection_movies.dart' as slMovies;

Future<void> main() async {
  Bloc.observer = BaseBloc();
  await Future.wait([slMovies.init()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => slMovies.sl<MoviesBloc>()..add(MoviesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MovieDetails(),
      ),
    );
  }
}
