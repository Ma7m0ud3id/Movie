class CategoryMovie {
  List<Genres>? genres;
  int? statusCode;  // manuel
  String? statusMessage; // manuel
  bool? success; // m

  CategoryMovie({
      this.genres,
      this.statusCode, // manuel
      this.statusMessage, // manuel
      this.success});

  CategoryMovie.fromJson(dynamic json) {
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (genres != null) {
      map["genres"] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Genres {
  int? id;
  String? name;

  Genres({
      this.id, 
      this.name});

  Genres.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}