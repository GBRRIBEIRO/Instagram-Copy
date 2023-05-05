import 'package:flutter/material.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:uuid/uuid.dart';

class Story {
  final String id;
  final Image media;
  List<User> whoSaw;
  final int durationSeconds;
  final DateTime postTime;
  bool isRead;

  Story({
    this.id = Uuid.NAMESPACE_OID,
    required this.media,
    this.whoSaw = const [],
    this.durationSeconds = 6,
    required this.postTime,
    this.isRead = false,
  });
}
