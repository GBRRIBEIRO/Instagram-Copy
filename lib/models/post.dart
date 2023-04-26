import 'comment.dart';
import 'package:uuid/uuid.dart';

class Post {
  late String id;
  final String userTag;
  final String mediaUrl;
  final int? likes;
  final List<Comment>? comments;
  final String? subtitle;
  final DateTime publishDate;

  Post(
    this.mediaUrl,
    this.publishDate,
    this.userTag, {
    this.likes,
    this.comments,
    this.subtitle,
  }) {
    id = const Uuid().v4();
  }
}
