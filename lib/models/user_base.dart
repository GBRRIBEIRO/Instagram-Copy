import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/story.dart';

class User {
  final String id;
  final String name;
  final String tag;
  final String imageUrl;
  final String biography;

  List<Story>? stories;
  List<Post>? posts;

  User(this.id, this.name, this.tag, this.imageUrl, this.biography,
      {this.stories, this.posts});
}
