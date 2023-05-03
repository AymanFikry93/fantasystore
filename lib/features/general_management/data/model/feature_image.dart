

class FeatureImage {
  int? id;
  String? src;
  String? name;
  FeatureImage(
      {
        this.id,
        this.src,
        this.name,
      });

  FeatureImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src']??json['guid']['rendered'];
    name = json['name']??json['title']['raw'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;

  }

  }
