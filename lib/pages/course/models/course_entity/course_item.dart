import 'teacher.dart';
import 'type.dart';
import 'lesson_detail.dart';

class CourseItem {
  int? id;
  List<LessonDetail>? lessons;
  List<Type>? type;
  Teacher? teacher;
  String? name;
  String? thumbnail;
  String? description;
  int? typeId;
  double? price;
  int? lessonNum;
  int? follow;
  double? score;
  double? videosLength;
  DateTime? createdAt;
  DateTime? updatedAt;

  CourseItem({
    this.id,
    this.lessons,
    this.type,
    this.teacher,
    this.name,
    this.thumbnail,
    this.description,
    this.typeId,
    this.price,
    this.videosLength,
    this.lessonNum,
    this.follow,
    this.score,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) => CourseItem(
        id: json['id'] as int?,
        lessons: (json['lessons'] as List<dynamic>?)
            ?.map((e) => LessonDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: (json['type'] as List<dynamic>?)
            ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
            .toList(),
        teacher: json['teacher'] == null
            ? null
            : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
        name: json['name'] as String?,
        thumbnail: json['thumbnail'] as String?,
        videosLength: (json['videos_length'] as num?)?.toDouble(),
        description: json['description'] as String?,
        typeId: json['type_id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        lessonNum: json['lesson_num'] as int?,
        follow: json['follow'] as int?,
        score: json['score'] as double?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'lessons': lessons?.map((e) => e.toJson()).toList(),
        'type': type?.map((e) => e.toJson()).toList(),
        'teacher': teacher?.toJson(),
        'name': name,
        'thumbnail': thumbnail,
        'videos_length': videosLength,
        'description': description,
        'type_id': typeId,
        'price': price,
        'lesson_num': lessonNum,
        'follow': follow,
        'score': score,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
