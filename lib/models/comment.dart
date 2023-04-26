class Comment {
  final String userTag;
  final String commentText;
  final int? likes;
  List<Comment>? replies;
  bool isLiked;

  Comment(
    this.userTag,
    this.isLiked, {
    this.likes,
    required this.commentText,
    this.replies,
  });
}
