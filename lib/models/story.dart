import 'package:flutter/material.dart';
import 'package:instagram_copy/models/user_base.dart';

class Story {
  final UserBase user;
  final List<Image> media;

  Story(this.user, this.media);
}
