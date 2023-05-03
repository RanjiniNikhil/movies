import 'package:movie_poster/bloc/base_state.dart';

class ImageSelectedState extends BaseState {
  bool isImageSelected;
  String image;

  ImageSelectedState(this.isImageSelected, this.image);
}
