import 'package:movies_app/models/TopRatedRespons.dart';

/// page : 1
/// results : [{"adult":false,"backdrop_path":"/5QEtCBM6aXHftr7sgFxxUUl9Ej8.jpg","genre_ids":[80,18,53,28],"id":75780,"original_language":"en","original_title":"Jack Reacher","overview":"When a gunman takes five lives with six shots, all evidence points to the suspect in custody. On interrogation, the suspect offers up a single note: \"Get Jack Reacher!\" So begins an extraordinary chase for the truth, pitting Jack Reacher against an unexpected enemy, with a skill for violence and a secret to keep.","popularity":81.828,"poster_path":"/uQBbjrLVsUibWxNDGA4Czzo8lwz.jpg","release_date":"2012-12-20","title":"Jack Reacher","video":false,"vote_average":6.6,"vote_count":5973},{"adult":false,"backdrop_path":"/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg","genre_ids":[28,53],"id":343611,"original_language":"en","original_title":"Jack Reacher: Never Go Back","overview":"When Major Susan Turner is arrested for treason, ex-investigator Jack Reacher undertakes the challenging task to prove her innocence and ends up exposing a shocking conspiracy.","popularity":74.7,"poster_path":"/bvCEEs5l3ylNIgH4foqOmQk0qdi.jpg","release_date":"2016-10-19","title":"Jack Reacher: Never Go Back","video":false,"vote_average":5.9,"vote_count":4127}]
/// total_pages : 1
/// total_results : 2

class SearchModel {
  SearchModel({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  SearchModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

