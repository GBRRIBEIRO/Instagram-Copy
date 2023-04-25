import 'comment.dart';
import 'package:uuid/uuid.dart';

class Post {
  late String id;
  final String mediaUrl;
  final int? likes;
  final List<Comment>? comments;
  final DateTime publishDate;

  Post(
    this.mediaUrl,
    this.publishDate, {
    this.likes,
    this.comments,
  }) {
    id = const Uuid().v4();
  }
}
