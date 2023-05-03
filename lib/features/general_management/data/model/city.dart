class City {
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  int? parent;

  //meta
  //links

  City({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        count: json['count'],
        description: json['description'],
        link: json['link'],
        name: json['name'],
        slug: json['slug'],
        taxonomy: json['taxonomy'],
        parent: json['parent'],
      );
}
