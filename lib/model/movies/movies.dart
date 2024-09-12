import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class MoviesModel with _$MoviesModel {

  factory MoviesModel({
    @Default('') @JsonKey(name: 'total') String total,
    @Default(0) @JsonKey(name: 'page') int page,
    @Default(0) @JsonKey(name: 'pages') int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow

  }) = _MovieModel;
  factory MoviesModel.fromJson(Map<String, dynamic> json) => _$MoviesModelFromJson(json);
}

@freezed
class TvShows with _$TvShows {

  factory TvShows({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'permalink') String permalink,
    @Default('') @JsonKey(name: 'end_date') String endDate,
    @Default('') @JsonKey(name: 'network') String network,
    @Default('') @JsonKey(name: 'image_thumbnail_path') String imageThumbnailPath,
    @Default('') @JsonKey(name: 'status') String status,

  }) = _TvShows;
  factory TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json);
}