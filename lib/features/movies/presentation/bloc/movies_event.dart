import 'package:movie_poster/bloc/base_event.dart';

class MoviesEvent extends BaseEvent {}

class ImageSelectedEvent extends BaseEvent {
  bool isImageSelected;
  String image;

  ImageSelectedEvent(this.isImageSelected, this.image);
}