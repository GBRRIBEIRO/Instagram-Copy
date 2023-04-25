import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';

import '../models/post.dart';

List<Post> postList = [];

var posts = USERS.map((user) {
  if (user.posts != null) {
    postList.addAll(user.posts as Iterable<Post>);
  }
});

final postsProvider = Provider((ref) => postList.sort(
    (postOne, postTwo) => postOne.publishDate.compareTo(postTwo.publishDate)));
