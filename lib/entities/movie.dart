class Movie {
  String title;
  String rank;
  String id;

  Movie({this.title, this.rank, this.id});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rank = json['rank'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['rank'] = this.rank;
    data['id'] = this.id;
    return data;
  }
}