import 'package:flutter/material.dart';

class CategoryModel {
  final int? id;
  final String title, description;
  final String imageUrl;

  CategoryModel({
     this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory CategoryModel.fromSnapshot(Map<dynamic, dynamic> json) => CategoryModel(
    id: json['id'],
    imageUrl: json['imageUrl'],
    description: json['description'],
    title: json['title'],
  );

}

