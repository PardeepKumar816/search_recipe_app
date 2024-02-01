class RecipeModel {
  RecipeModel({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });
  late final List<Results> results;
  late final int offset;
  late final int number;
  late final int totalResults;

  RecipeModel.fromJson(Map<String, dynamic> json){
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['results'] = results.map((e)=>e.toJson()).toList();
    data['offset'] = offset;
    data['number'] = number;
    data['totalResults'] = totalResults;
    return data;
  }
}

class Results {
  Results({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });
  late final int id;
  late final String title;
  late final String image;
  late final String imageType;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['imageType'] = imageType;
    return data;
  }
}