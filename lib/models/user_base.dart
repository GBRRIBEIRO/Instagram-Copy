import 'package:flutter/material.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/story.dart';

class User {
  final String id;
  final String name;
  final String tag;
  final Image image;
  final String biography;

  List<Story>? stories;
  List<Post>? posts;

  User(this.id, this.name, this.tag, this.image, this.biography,
      {this.stories, this.posts});
}
