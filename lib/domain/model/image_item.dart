class ImageItem {
  final String previewURL;
  final String tags;
  final int id;

//<editor-fold desc="Data Methods">
  const ImageItem({
    required this.previewURL,
    required this.tags,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          previewURL == other.previewURL &&
          tags == other.tags &&
          id == other.id);

  @override
  int get hashCode => previewURL.hashCode ^ tags.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'ImageItem{' +
        ' previewURL: $previewURL,' +
        ' tags: $tags,' +
        ' id: $id,' +
        '}';
  }

  ImageItem copyWith({
    String? previewURL,
    String? tags,
    int? id,
  }) {
    return ImageItem(
      previewURL: previewURL ?? this.previewURL,
      tags: tags ?? this.tags,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'previewURL': this.previewURL,
      'tags': this.tags,
      'id': this.id,
    };
  }

  factory ImageItem.fromMap(Map<String, dynamic> map) {
    return ImageItem(
      previewURL: map['previewURL'] as String,
      tags: map['tags'] as String,
      id: map['id'] as int,
    );
  }

//</editor-fold>
}
