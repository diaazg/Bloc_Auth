import 'package:equatable/equatable.dart';

class Notes extends Equatable {
  final String? title;
  final String? content;
  final DateTime? date;

  const Notes({this.title, this.content, this.date});

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        title: json['title'] as String?,
        content: json['content'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'date': date?.toIso8601String(),
      };

  @override
  List<Object?> get props => [title, content, date];
}
