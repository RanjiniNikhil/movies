import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_poster/bloc/base_state.dart';
import 'package:movie_poster/features/movies/domain/entities/movies_response_item.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_event.dart';
import 'package:movie_poster/features/movies/presentation/bloc/movies_state.dart';
import 'package:movie_poster/stringConstant.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isImageSelected = false;
  String image = "";
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = BlocProvider.of<MoviesBloc>(context);
  }

  Widget imagesList(List<TvShow> tvShows) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
          itemCount: tvShows.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  moviesBloc.add(ImageSelectedEvent(
                      true, tvShows[index].imageThumbnailPath));
                },
                child: imageWidget(100, 100, tvShows[index].imageThumbnailPath,
                    EdgeInsets.symmetric(horizontal: 2, vertical: 4)));
          }),
    );
  }

  Widget imageWidget(double height, double width, String thumbnailImage,
      EdgeInsetsGeometry? margin) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(thumbnailImage), fit: BoxFit.fill)));
  }

  Widget titleList(List<TvShow> tvShows) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: tvShows.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              color: Colors.black12,
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              width: MediaQuery.of(context).size.width,
              child: Text(tvShows[index].name),
            );
          }),
    );
  }

  Widget cancelWidget() {
    return Positioned(
      top: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          moviesBloc.add(ImageSelectedEvent(false, ""));
        },
        child: Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget view(BuildContext context) {
    late Movies movies;
    return BlocBuilder<MoviesBloc, BaseState>(builder: (context, state) {
      if (state is StateLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is StateErrorGeneral) {
        return Center(child: Text(StringConstant.kSomethingWentWrong));
      } else {
        if (state is StateOnSuccess) {
          movies = state.response;
        } else if (state is ImageSelectedState) {
          isImageSelected = state.isImageSelected;
          image = state.image;
        }

        return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [imagesList(movies.tvShows), titleList(movies.tvShows)],
            ),
          ),
          isImageSelected == false
              ? Container()
              : Stack(children: [
                  imageWidget(
                      MediaQuery.of(context).size.height * 0.6,
                      MediaQuery.of(context).size.width,
                      image,
                      EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
                  cancelWidget()
                ])
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringConstant.movies),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: view(context),
    );
  }
}
