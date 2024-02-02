// if any value from api is null then default value will be assigned
// based on data type e.g "", 0, [], {}


class RecipeModel {
  RecipeModel({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });
    List<Results>? results;
    int? offset;
    int? number;
    int? totalResults;

  RecipeModel.fromJson(Map<String, dynamic> json){
    results = List.from(json['results']??[]).map((e)=>Results.fromJson(e)).toList();
    offset = json['offset']??0;
    number = json['number']??0;
    totalResults = json['totalResults']??0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['results'] = results!.map((e)=>e.toJson()).toList();
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
  int? id;
   String? title;
   String? image;
   String? imageType;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??"";
    image = json['image']??"";
    imageType = json['imageType']??"";
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