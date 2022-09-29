import 'TopRatedRespons.dart';

class FiltredMovies {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  int? statusCode;  // manuel
  String? statusMessage; // manuel
  bool? success; // manuel

  FiltredMovies({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,
      this.statusCode, // manuel
      this.statusMessage, // manuel
      this.success}); // manuel

  FiltredMovies.fromJson(dynamic json) {
    page = json["page"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = page;
    if (results != null) {
      map["results"] = results?.map((v) => v.toJson()).toList();
    }
    map["total_pages"] = totalPages;
    map["total_results"] = totalResults;
    return map;
  }

}

