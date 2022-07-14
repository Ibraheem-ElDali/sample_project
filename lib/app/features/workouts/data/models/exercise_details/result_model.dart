import 'file_model.dart';

class ResultModel {
  ResultModel({
    this.id,
    this.calories,
    this.fat,
    this.categoryId,
    this.machineNumber,
    this.productCounts,
    this.productRecords,
    this.description,
    this.shortDescription2,
    this.shortDescription3,
    this.shortDescription4,
    this.url,
    this.percentage,
    this.defaultImageUri,
    this.name,
    this.discount,
    this.originalPrice,
    this.files,
  });

  factory ResultModel.fromJson(Map<String, dynamic> map) {
    return ResultModel(
      id: map['id'] ?? 'UnKnown',
      calories: map['calories'] ?? 'UnKnown',
      fat: map['fat'] ?? 'UnKnown',
      categoryId: map['categoryId'] ?? 'UnKnown',
      machineNumber: map['machineNumber'],
      productCounts: map['productCounts'],
      productRecords: map['productRecords'],
      description: map['description'] ?? 'UnKnown',
      shortDescription2: map['shortDescription2'] ?? 'UnKnown',
      shortDescription3: map['shortDescription3'] ?? 'UnKnown',
      shortDescription4: map['shortDescription4'] ?? 'UnKnown',
      url: map['url'] ?? 'UnKnown',
      percentage: map['percentage'] ?? 'UnKnown',
      defaultImageUri: map['defaultImageUri'] ?? 'UnKnown',
      name: map['name'] ?? 'UnKnown',
      discount: map['discount'],
      originalPrice: map['originalPrice'],
      files: List<FileModel>.from(
        map['files'].map((e) => FileModel.fromJson(e)),
      ),
    );
  }

  final int? id;
  final int? calories;
  final int? fat;
  final int? categoryId;
  final dynamic machineNumber;
  final dynamic productCounts;
  final dynamic productRecords;
  final String? description;
  final String? shortDescription2;
  final String? shortDescription3;
  final String? shortDescription4;
  final String? url;
  final String? percentage;
  final String? defaultImageUri;
  final String? name;
  final dynamic discount;
  final dynamic originalPrice;
  final List<FileModel>? files;
}
