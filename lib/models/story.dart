import 'package:flutter/material.dart';

class Story {
  final String userTag;
  final Image userImage;
  final List<Image> media;
  final List<String> whoSawTag;

  Story(this.media, this.userImage, this.userTag, {this.whoSawTag = const []});
}
