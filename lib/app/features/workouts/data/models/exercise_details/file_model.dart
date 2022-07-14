class FileModel {
  FileModel({
    this.uri,
    this.altText,
  });

  factory FileModel.fromJson(Map<String, dynamic> map) {
    return FileModel(
      uri: map['uri'] ?? 'UnKnown',
      altText: map['altText'] ?? 'UnKnown',
    );
  }

  final String? uri;
  final String? altText;
}
