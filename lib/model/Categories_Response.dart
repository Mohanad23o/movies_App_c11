library;

class CategoriesResponse {
  CategoriesResponse({
    this.genres,
    this.status_message,
    this.status_code,
    this.success,});

  CategoriesResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
        status_message = json['status_message'];
        status_code = json['status_code'];
        success = json['success'];
      });
    }
  }
  List<Genres>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  int? status_code;
  String? status_message;
  bool? success;

}

class Genres {
  Genres({
      this.id, 
      this.name,
      this.status_message,
      this.status_code,
      this.success,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status_message = json['status_message'];
    status_code = json['status_code'];
    success = json['success'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
  int? status_code;
  String? status_message;
  bool? success;

}