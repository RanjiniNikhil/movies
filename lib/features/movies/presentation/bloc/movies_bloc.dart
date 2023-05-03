import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_poster/bloc/base_event.dart';
import 'package:movie_poster/bloc/base_state.dart';
import 'package:movie_poster/core/usecase/usecases.dart';
import 'package:movie_poster/features/movies/domain/usecase/movie_details_item.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_event.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_state.dart';

class MoviesBloc extends Bloc<BaseEvent, BaseState> {
  MoviesItem moviesItem;
  bool isImageSelected = false;

  MoviesBloc(this.moviesItem) : super(StateLoading());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is MoviesEvent) {
      yield StateLoading();
      fetchMoviesInfo();
    } else if (event is EventErrorGeneral) {
      yield StateErrorGeneral(event.errorMessage);
    } else if (event is EventOnSuccess) {
      yield StateOnSuccess(event.response);
    } else if (event is ImageSelectedEvent) {
      isImageSelected = event.isImageSelected;
      yield ImageSelectedState(isImageSelected, event.image);
    }
  }

  fetchMoviesInfo() {
    moviesItem.call(NoParams()).listen((event) {
      event.fold((onError) {
        add(EventErrorGeneral(onError.toString()));
      }, (response) {
        add(EventOnSuccess(response));
      });
    });
  }
}
