class LessonDetailModel {
  int? id;
  String? video;
  dynamic videoLength;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? course;
  String? thumbnail;

  LessonDetailModel({
    this.id,
    this.video,
    this.videoLength,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.course,
    this.thumbnail,
  });

  factory LessonDetailModel.fromJson(Map<String, dynamic> json) =>
      LessonDetailModel(
        id: json['id'] as int?,
        video: json['video'] as String?,
        videoLength: json['video_length'] as dynamic,
        title: json['title'] as String?,
        description: json['description'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        course: json['course'] as int?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'video': video,
        'video_length': videoLength,
        'title': title,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'course': course,
        'thumbnail': thumbnail,
      };
}
