class Comment {
  final String userTag;
  final String commentText;
  final int likes;
  List<Comment> replies;
  bool isLiked;

  Comment(
    this.userTag,
    this.likes,
    this.isLiked, {
    required this.commentText,
    required this.replies,
  });
}
