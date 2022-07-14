class ResultModel {
  ResultModel({
    this.id,
    this.productCount,
    this.name,
    this.logoUrl,
    this.isActive,
    this.isFeatured,
  });

  factory ResultModel.fromJson(Map<String, dynamic> map) {
    return ResultModel(
      id: map['id'] ?? 'UnKnown',
      productCount: map['productCount'] ?? 'UnKnown',
      name: map['name'] ?? 'UnKnown',
      logoUrl: map['logoUrl'] ?? 'UnKnown',
      isActive: map['isActive'] ?? 'UnKnown',
      isFeatured: map['isFeatured'] ?? 'UnKnown',
    );
  }

  final int? id;
  final String? name;
  final String? logoUrl;
  final int? productCount;
  final bool? isActive;
  final bool? isFeatured;
}
